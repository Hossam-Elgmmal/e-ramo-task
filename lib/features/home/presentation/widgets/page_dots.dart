import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';

/// 8px dots with a 10px gap, as in the Figma pagination indicator.
class PageDots extends StatelessWidget {
  const PageDots({super.key, required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < count; i++) ...[
          if (i > 0) const SizedBox(width: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == index ? AppColors.primary : AppColors.border,
            ),
          ),
        ],
      ],
    );
  }
}
