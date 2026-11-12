import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/property_meta.dart';

/// Wide 171px-high card used in "أحدث الشقق / الفيلات / الدوبلكس".
/// The image is on the right (start side in RTL), details on the left.
class PropertyListCard extends StatelessWidget {
  const PropertyListCard({super.key, required this.property, this.onTap});

  final Property property;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: Material(
        color: AppColors.background,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: AppColors.border),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 156,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LazyAssetImage(assetPath: property.imageAsset, fit: BoxFit.cover),
                    Positioned(
                      left: 0,
                      top: 10,
                      child: ListingTypeBadge(
                        type: property.type,
                        color: AppColors.border,
                        width: 60,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: _Details(property: property)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          right: 12,
          top: 20,
          height: 21,
          child: Row(
            children: [
              Expanded(child: PropertyPriceText(property: property)),
              SvgPicture.asset(
                AppAssets.icFavoriteList,
                width: 18.23,
                height: 16,
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 12,
          top: 41,
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
          right: 12,
          top: 77,
          child: PropertyDetailsRow(
            areaSqft: property.areaSqft,
            bathrooms: property.bathrooms,
            bedrooms: property.bedrooms,
          ),
        ),
        Positioned(
          left: 70,
          right: 12,
          top: 101,
          height: 21,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconTextLine(
              iconAsset: AppAssets.icLocationList,
              iconWidth: 9,
              iconHeight: 12,
              text: property.location,
            ),
          ),
        ),
        Positioned(
          left: 70,
          right: 12,
          top: 130,
          height: 21,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: IconTextLine(
              iconAsset: AppAssets.icClock,
              text: property.postedAgo,
            ),
          ),
        ),
        const Positioned(left: 11, top: 104, child: PublisherBadge()),
      ],
    );
  }
}
