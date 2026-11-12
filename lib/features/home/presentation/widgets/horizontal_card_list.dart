import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_dimens.dart';

/// Fixed-height horizontal list. In RTL the first item sits on the right.
class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({
    super.key,
    required this.height,
    required this.itemCount,
    required this.itemBuilder,
    this.spacing = 16,
  });

  final double height;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.pagePadding),
        itemCount: itemCount,
        separatorBuilder: (_, __) => SizedBox(width: spacing),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
