import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';

/// White top bar: logo, city selector, menu / notifications / messages, search.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.onMenuTap});

  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 26,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(23, 8, 23, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top bar: menu (far left), logo (center), messages + notifications (right).
              SizedBox(
                height: 35,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const LazyAssetImage(
                      assetPath: AppAssets.logo,
                      width: 98,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                    // RTL: the first child is on the right, the last on the far left.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _HeaderButton(
                              onTap: () => context.pushPlaceholder(
                                AppStrings.isArabic ? 'الرسائل' : 'Messages',
                              ),
                              child: const _MessagesIcon(count: 5),
                            ),
                            const SizedBox(width: 16),
                            _HeaderButton(
                              onTap: () => context.pushPlaceholder(
                                AppStrings.isArabic ? 'الإشعارات' : 'Notifications',
                              ),
                              child: const _NotificationIcon(count: 2),
                            ),
                          ],
                        ),
                        _HeaderButton(
                          onTap: onMenuTap ??
                              () {
                                final scaffold = Scaffold.maybeOf(context);
                                if (scaffold != null) {
                                  // Open from the RIGHT side
                                  if (Directionality.of(context) ==
                                      TextDirection.rtl) {
                                    scaffold.openDrawer();
                                  } else {
                                    scaffold.openEndDrawer();
                                  }
                                }
                              },
                          child: SvgPicture.asset(
                            AppAssets.icMenu,
                            width: 34,
                            height: 34,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // City selector now has its own row below the top bar.
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: _CitySelector(
                  onTap: () => context.pushPlaceholder(AppStrings.city),
                ),
              ),
              const SizedBox(height: 12),
              _SearchField(
                onTap: () => context.pushPlaceholder(AppStrings.searchHint),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}

class _CitySelector extends StatelessWidget {
  const _CitySelector({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 4),
            Text(AppStrings.city, style: AppTextStyles.citySelector),
            const SizedBox(width: 8),
            SvgPicture.asset(AppAssets.icArrowDown, width: 10, height: 10),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.searchFill,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.icSearch, width: 17.83, height: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  AppStrings.searchHint,
                  style: AppTextStyles.searchHint,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Red count bubble at the bottom-right of a 35x35 header icon.
class _CountBadge extends StatelessWidget {
  const _CountBadge(this.count);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.4167,
      top: 17.5,
      width: 14.5833,
      height: 14.5833,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.icBadgeCircle,
            width: 14.5833,
            height: 14.5833,
          ),
          Text('$count', style: AppTextStyles.countBadge),
        ],
      ),
    );
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Stack(
        children: [
          Positioned(
            left: 6.286,
            top: 2.9164,
            width: 22.4345,
            height: 29.1669,
            child: SvgPicture.asset(AppAssets.icNotification),
          ),
          _CountBadge(count),
        ],
      ),
    );
  }
}

/// The messages glyph is exported as three vectors that must be stacked.
class _MessagesIcon extends StatelessWidget {
  const _MessagesIcon({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Stack(
        children: [
          Positioned(
            left: 2.1667,
            top: 8,
            width: 24.81,
            height: 24.88,
            child: SvgPicture.asset(AppAssets.icMessageFront),
          ),
          Positioned(
            left: 8.0625,
            top: 2.1667,
            width: 24.75,
            height: 21.25,
            child: SvgPicture.asset(AppAssets.icMessageBack),
          ),
          Positioned(
            left: 8.4719,
            top: 18.3229,
            width: 12.2229,
            height: 2,
            child: SvgPicture.asset(AppAssets.icMessageLine),
          ),
          _CountBadge(count),
        ],
      ),
    );
  }
}
