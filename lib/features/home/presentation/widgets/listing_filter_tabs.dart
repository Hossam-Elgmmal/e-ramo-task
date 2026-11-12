import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';
import 'package:real_estate_emtalik/core/theme/app_text_styles.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';

/// "الكل | للبيع | للإيجار" tabs. The selected tab is black, the rest grey.
class ListingFilterTabs extends StatelessWidget {
  const ListingFilterTabs({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final ListingFilter selected;
  final ValueChanged<ListingFilter> onChanged;

  static String _label(ListingFilter filter) => switch (filter) {
        ListingFilter.all => AppStrings.filterAll,
        ListingFilter.sale => AppStrings.filterSale,
        ListingFilter.rent => AppStrings.filterRent,
      };

  @override
  Widget build(BuildContext context) {
    const filters = ListingFilter.values;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < filters.length; i++) ...[
          if (i > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '|',
                style: AppTextStyles.filterTab.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onChanged(filters[i]),
            child: Text(
              _label(filters[i]),
              style: AppTextStyles.filterTab.copyWith(
                color: filters[i] == selected
                    ? AppColors.black
                    : AppColors.lightGray,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
