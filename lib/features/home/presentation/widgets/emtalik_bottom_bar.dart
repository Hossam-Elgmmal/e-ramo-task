import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';

enum BottomBarItem { properties, offers, home, market, developers }

/// Bottom bar with the raised round "home" button in the middle.
/// Home is the current tab; the other items are handled by [onItemTap].
class EmtalikBottomBar extends StatelessWidget {
  const EmtalikBottomBar({super.key, required this.onItemTap});

  final ValueChanged<BottomBarItem> onItemTap;

  static const _barHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: _barHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    _NavItem(
                      iconAsset: AppAssets.icNavProperties,
                      label: AppStrings.navProperties,
                      onTap: () => onItemTap(BottomBarItem.properties),
                    ),
                    _NavItem(
                      iconAsset: AppAssets.icNavOffers,
                      label: AppStrings.navOffers,
                      onTap: () => onItemTap(BottomBarItem.offers),
                    ),
                    // Empty slot under the raised home button.
                    const Expanded(child: SizedBox.shrink()),
                    _NavItem(
                      iconAsset: AppAssets.icNavMarket,
                      label: AppStrings.navMarket,
                      onTap: () => onItemTap(BottomBarItem.market),
                    ),
                    _NavItem(
                      iconAsset: AppAssets.icNavDevelopers,
                      label: AppStrings.navDevelopers,
                      iconWidth: 28.613,
                      iconHeight: 21,
                      onTap: () => onItemTap(BottomBarItem.developers),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          top: -33,
          left: 0,
          right: 0,
          child: Center(child: _HomeButton()),
        ),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.iconAsset,
    required this.label,
    required this.onTap,
    this.iconWidth = 24,
    this.iconHeight = 24,
  });

  final String iconAsset;
  final String label;
  final VoidCallback onTap;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
              child: SvgPicture.asset(
                iconAsset,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
            const SizedBox(height: 6),
            Text(label, style: AppTextStyles.navLabel),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.white, width: 4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33005879),
            blurRadius: 5.5,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: SvgPicture.asset(AppAssets.icNavHome, width: 35, height: 35),
    );
  }
}
