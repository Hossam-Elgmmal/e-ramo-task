import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_dimens.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/listing_filter_tabs.dart';

/// Section title + "مشاهدة الكل" link, with optional listing filter tabs.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onViewAll,
    this.filter,
    this.onFilterChanged,
  }) : assert(
          (filter == null) == (onFilterChanged == null),
          'filter and onFilterChanged must be provided together',
        );

  final String title;
  final VoidCallback onViewAll;
  final ListingFilter? filter;
  final ValueChanged<ListingFilter>? onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(title, style: AppTextStyles.sectionTitle)),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onViewAll,
                child: Text(AppStrings.viewAll, style: AppTextStyles.viewAll),
              ),
            ],
          ),
          if (filter != null) ...[
            const SizedBox(height: 12),
            ListingFilterTabs(
              selected: filter!,
              onChanged: onFilterChanged!,
            ),
          ],
        ],
      ),
    );
  }
}
