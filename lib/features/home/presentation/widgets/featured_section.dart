import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/presentation/bloc/home_bloc.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/horizontal_card_list.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/property_card.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/section_header.dart';

/// "عقارات مميزة في مصر": filterable list of tall property cards.
class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key, required this.properties});

  final List<Property> properties;

  @override
  Widget build(BuildContext context) {
    final filter = context
        .select((HomeBloc bloc) => bloc.state.filterOf(HomeSection.featured));
    final items = filter.apply(properties);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: AppStrings.featuredTitle,
          filter: filter,
          onFilterChanged: (value) => context
              .read<HomeBloc>()
              .add(HomeFilterChanged(HomeSection.featured, value)),
          onViewAll: () => context.pushPlaceholder(AppStrings.featuredTitle),
        ),
        const SizedBox(height: 24),
        HorizontalCardList(
          height: 309,
          itemCount: items.length,
          itemBuilder: (context, index) => PropertyCard(
            property: items[index],
            onTap: () => context.pushPlaceholder(items[index].title),
          ),
        ),
      ],
    );
  }
}
