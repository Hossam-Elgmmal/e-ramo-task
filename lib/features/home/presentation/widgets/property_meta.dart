import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/core/utils/number_extensions.dart';
import 'package:real_estate_emtalik/core/widgets/lazy_image.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';

/// Small icon + text line (location / posted time). Icon sits at the start.
class IconTextLine extends StatelessWidget {
  const IconTextLine({
    super.key,
    required this.iconAsset,
    required this.text,
    this.iconWidth = 12,
    this.iconHeight = 12,
  });

  final String iconAsset;
  final String text;
  final double iconWidth;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(iconAsset, width: iconWidth, height: iconHeight),
        const SizedBox(width: 5),
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.cardMeta,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

/// The little "area" glyph (square with four corner dots) drawn in code.
class AreaIcon extends StatelessWidget {
  const AreaIcon({super.key});

  static const _corners = [
    Offset(0, 0),
    Offset(10, 0),
    Offset(0, 10),
    Offset(10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 13,
      height: 13,
      child: Stack(
        children: [
          Positioned(
            left: 1,
            top: 1,
            width: 11,
            height: 11,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
              ),
            ),
          ),
          for (final corner in _corners)
            Positioned(
              left: corner.dx,
              top: corner.dy,
              width: 3,
              height: 3,
              child: const ColoredBox(color: AppColors.black),
            ),
        ],
      ),
    );
  }
}

/// "8,725sqft [area] | 5 [bath] | 10 [bed]". Always laid out left-to-right.
class PropertyDetailsRow extends StatelessWidget {
  const PropertyDetailsRow({
    super.key,
    required this.areaSqft,
    required this.bathrooms,
    required this.bedrooms,
  });

  final int areaSqft;
  final int bathrooms;
  final int bedrooms;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Detail(
              label: '${areaSqft.withThousandsSeparator}sqft',
              icon: const AreaIcon(),
            ),
            _Detail(
              label: '$bathrooms',
              icon: SvgPicture.asset(AppAssets.icBathroom, width: 16, height: 16),
            ),
            _Detail(
              label: '$bedrooms',
              icon: SvgPicture.asset(AppAssets.icBed, width: 14, height: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({required this.label, required this.icon});

  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppTextStyles.cardDetail),
        const SizedBox(width: 2),
        icon,
      ],
    );
  }
}

/// "4,000,000 ج.م" or "4,000 ج.م شهريا" for rentals.
class PropertyPriceText extends StatelessWidget {
  const PropertyPriceText({super.key, required this.property});

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                '${property.price.withThousandsSeparator} ${AppStrings.currency}',
            style: AppTextStyles.cardPrice,
          ),
          if (property.type == ListingType.rent)
            TextSpan(
              text: ' ${AppStrings.perMonth}',
              style: AppTextStyles.cardPriceSuffix,
            ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// "بواسطة" label with the publisher logo underneath.
class PublisherBadge extends StatelessWidget {
  const PublisherBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppStrings.publishedBy, style: AppTextStyles.publisherLabel),
        Container(
          width: 48,
          height: 33,
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const LazyAssetImage(
            assetPath: AppAssets.publisherLogo,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

/// "للبيع" / "للإيجار" tag pinned to the image corner (rounded top-right).
class ListingTypeBadge extends StatelessWidget {
  const ListingTypeBadge({
    super.key,
    required this.type,
    required this.color,
    required this.width,
    required this.height,
  });

  final ListingType type;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(8)),
      ),
      child: Text(
        type == ListingType.rent ? AppStrings.forRent : AppStrings.forSale,
        style: AppTextStyles.listingBadge,
      ),
    );
  }
}

/// Gold "مميز" pill attached to the card's right edge.
class FeaturedBadge extends StatelessWidget {
  const FeaturedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 18,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.rotate(
            angle: -math.pi / 6,
            child: SvgPicture.asset(AppAssets.icMagicStar, width: 14, height: 14),
          ),
          const SizedBox(width: 4),
          Text(AppStrings.featuredBadge, style: AppTextStyles.featuredBadge),
        ],
      ),
    );
  }
}

/// Green "مشروع" pill attached to a project card's right edge.
class ProjectBadge extends StatelessWidget {
  const ProjectBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79,
      height: 23,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.icBuildings, width: 15, height: 15),
          const SizedBox(width: 6),
          Text(AppStrings.projectBadge, style: AppTextStyles.projectBadge),
        ],
      ),
    );
  }
}
