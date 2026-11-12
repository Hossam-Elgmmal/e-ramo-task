import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/city_stats.dart';

/// 186x250 city tile with the name centred and listing counts at the bottom.
class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.city, this.onTap});

  final CityStats city;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 186,
      height: 250,
      child: Material(
        color: AppColors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LazyAssetImage(assetPath: city.imageAsset, fit: BoxFit.cover),
              // Subtle scrim so the white text stays readable on any photo.
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0x00000000), Color(0x66000000)],
                  ),
                ),
              ),
              Center(child: Text(city.name, style: AppTextStyles.cityName)),
              PositionedDirectional(
                start: 14,
                end: 14,
                bottom: 16,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.propertiesForSale(city.forSaleCount),
                      style: AppTextStyles.cityStat,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      AppStrings.propertiesForRent(city.forRentCount),
                      style: AppTextStyles.cityStat,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
