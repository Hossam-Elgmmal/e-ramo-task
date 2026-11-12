import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/localization/app_locale_cubit.dart';
import 'package:real_estate_emtalik/core/localization/app_localizations.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';

/// Side drawer matching Figma frame 34343, opening from the right and supporting
/// Arabic/English language toggle.
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final isAr = loc.isArabic;

    return Drawer(
      width: 270,
      backgroundColor: AppColors.background,
      elevation: 12,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          children: [
            // Top Bar: "المزيد" / "More" on right, Flag / Language button on left
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title / Close action
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Transform.flip(
                            flipX:
                                Directionality.of(context) == TextDirection.rtl,
                            child: SvgPicture.asset(
                              AppAssets.icArrowLeft,
                              width: 20,
                              height: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            loc.translate('drawer_more'),
                            style: GoogleFonts.notoKufiArabic(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Language Switcher Pill Button
                  InkWell(
                    onTap: () {
                      context.read<LocaleCubit>().toggleLocale();
                    },
                    borderRadius: BorderRadius.circular(124),
                    child: Container(
                      width: 68,
                      height: 43,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.icArrowDown,
                            width: 8,
                            height: 8,
                          ),
                          const SizedBox(width: 8),
                          const ClipOval(
                            child: LazyAssetImage(
                              assetPath: AppAssets.flagEg,
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, thickness: 0.5, color: AppColors.border),
            const SizedBox(height: 16),

            // User Info Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  context.pushPlaceholder(loc.translate('drawer_user_name'));
                },
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    // Avatar (loaded lazily)
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border, width: 1),
                      ),
                      child: const ClipOval(
                        child: LazyAssetImage(
                          assetPath: AppAssets.userAvatar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorWidget: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            child: Icon(Icons.person, color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // User name & city
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            loc.translate('drawer_user_name'),
                            style: GoogleFonts.notoKufiArabic(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            loc.translate('drawer_user_location'),
                            style: GoogleFonts.notoKufiArabic(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Arrow
                    Transform.flip(
                      flipX: Directionality.of(context) == TextDirection.rtl,
                      child: SvgPicture.asset(
                        AppAssets.icArrowRight,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),

            // 10 Menu Items from Figma Frame 34342 + Language switch
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: [
                  _DrawerItem(
                    title: loc.translate('drawer_favorites'),
                    iconAsset: AppAssets.icDrawerFavorites,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_favorites'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_notifications'),
                    iconAsset: AppAssets.icDrawerNotification,
                    badgeCount: 2,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_notifications'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_messages'),
                    iconAsset: AppAssets.icDrawerMessages,
                    badgeCount: 5,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_messages'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_add_property'),
                    customIcon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SvgPicture.asset(
                              AppAssets.icDrawerAddBuilding,
                            ),
                          ),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: SvgPicture.asset(
                              AppAssets.icDrawerAddPlus,
                              width: 6,
                              height: 6,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_add_property'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_packages'),
                    iconAsset: AppAssets.icDrawerPackages,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_packages'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_projects'),
                    iconAsset: AppAssets.icDrawerProjects,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_projects'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_help'),
                    iconAsset: AppAssets.icDrawerHelp,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_help'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_support'),
                    iconAsset: AppAssets.icDrawerSupport,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_support'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_join'),
                    iconAsset: AppAssets.icDrawerJoin,
                    onTap: () {
                      Navigator.of(context).pop();
                      context.pushPlaceholder(
                        loc.translate('drawer_join'),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  // Explicit Language Switch Row
                  _DrawerItem(
                    title: isAr
                        ? 'تغيير اللغة (English)'
                        : 'Change Language (العربية)',
                    customIcon: const Icon(
                      Icons.language_rounded,
                      size: 20,
                      color: AppColors.primary,
                    ),
                    onTap: () {
                      context.read<LocaleCubit>().toggleLocale();
                    },
                  ),
                  const SizedBox(height: 16),
                  _DrawerItem(
                    title: loc.translate('drawer_logout'),
                    iconAsset: AppAssets.icDrawerLogout,
                    onTap: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(loc.translate('logged_out'))),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.title,
    this.iconAsset,
    this.customIcon,
    this.badgeCount,
    required this.onTap,
  });

  final String title;
  final String? iconAsset;
  final Widget? customIcon;
  final int? badgeCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 240,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Icon
            if (customIcon != null)
              customIcon!
            else if (iconAsset != null)
              SvgPicture.asset(
                iconAsset!,
                width: 20,
                height: 20,
              ),
            const SizedBox(width: 10),

            // Item title
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.notoKufiArabic(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  letterSpacing: -0.3,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Badge count (if present)
            if (badgeCount != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.icBadgeCircle,
                    width: 14.5833,
                    height: 14.5833,
                  ),
                  Text(
                    '$badgeCount',
                    style: GoogleFonts.notoKufiArabic(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      height: 1,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
