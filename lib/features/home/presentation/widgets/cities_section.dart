import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/city_stats.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/city_card.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/section_header.dart';

/// "إبحث عن عقارك بالمدينة".
class CitiesSection extends StatelessWidget {
  const CitiesSection({super.key, required this.cities});

  final List<CityStats> cities;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: AppStrings.citiesTitle,
          onViewAll: () => context.pushPlaceholder(AppStrings.citiesTitle),
        ),
        const SizedBox(height: 25),
        HorizontalCardList(
          height: 250,
          spacing: 12,
          itemCount: cities.length,
          itemBuilder: (context, index) => CityCard(
            city: cities[index],
            onTap: () => context.pushPlaceholder(cities[index].name),
          ),
        ),
      ],
    );
  }
}
