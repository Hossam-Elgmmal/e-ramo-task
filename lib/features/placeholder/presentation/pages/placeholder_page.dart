import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/theme/app_colors.dart';

/// Destination for every tappable element until the real screens exist.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.construction_rounded,
              size: 64,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Text(AppStrings.comingSoon, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              AppStrings.comingSoonSubtitle,
              style: textTheme.bodyMedium?.copyWith(color: AppColors.gray),
            ),
          ],
        ),
      ),
    );
  }
}
