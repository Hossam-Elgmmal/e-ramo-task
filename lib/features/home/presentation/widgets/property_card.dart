import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/property_meta.dart';

/// Tall 230x309 card used in "عقارات مميزة". Border colour depends on type.
class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key, required this.property, this.onTap});

  final Property property;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isRent = property.type == ListingType.rent;
    final accent = isRent ? AppColors.amber : AppColors.gold;

    return SizedBox(
      width: 230,
      height: 309,
      child: Material(
        color: AppColors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(color: accent),
        ),
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                height: 150,
                child: LazyAssetImage(assetPath: property.imageAsset, fit: BoxFit.cover),
              ),
              Positioned(
                left: 1,
                top: 118,
                child: ListingTypeBadge(
                  type: property.type,
                  color: accent,
                  width: 98,
                  height: 32,
                ),
              ),
              if (property.isFeatured)
                const Positioned(right: 0, top: 124, child: FeaturedBadge()),
              Positioned(
                left: 21,
                right: 20,
                top: 158,
                height: 21,
                child: Row(
                  children: [
                    Expanded(child: PropertyPriceText(property: property)),
                    SvgPicture.asset(
                      isRent
                          ? AppAssets.icFavoriteRent
                          : AppAssets.icFavoriteSale,
                      width: 18.23,
                      height: 16,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 21,
                right: 20,
                top: 179,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    property.title,
                    style: AppTextStyles.cardTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 215,
                child: PropertyDetailsRow(
                  areaSqft: property.areaSqft,
                  bathrooms: property.bathrooms,
                  bedrooms: property.bedrooms,
                ),
              ),
              Positioned(
                left: 72,
                right: 20,
                top: 239,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconTextLine(
                    iconAsset: isRent
                        ? AppAssets.icLocationRent
                        : AppAssets.icLocationSale,
                    iconWidth: 9,
                    iconHeight: 12,
                    text: property.location,
                  ),
                ),
              ),
              Positioned(
                left: 72,
                right: 20,
                top: 268,
                height: 21,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: IconTextLine(
                    iconAsset: AppAssets.icClock,
                    text: property.postedAgo,
                  ),
                ),
              ),
              const Positioned(left: 12, top: 242, child: PublisherBadge()),
            ],
          ),
        ),
      ),
    );
  }
}
