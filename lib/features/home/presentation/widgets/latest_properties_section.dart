import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/presentation/bloc/home_bloc.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/page_dots.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/property_list_card.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/section_header.dart';

/// "أحدث الشقق / الفيلات / الدوبلكس": filter tabs + paged wide cards + dots.
class LatestPropertiesSection extends StatelessWidget {
  const LatestPropertiesSection({
    super.key,
    required this.title,
    required this.section,
    required this.carousel,
    required this.properties,
  });

  final String title;
  final HomeSection section;
  final HomeCarousel carousel;
  final List<Property> properties;

  @override
  Widget build(BuildContext context) {
    final filter =
        context.select((HomeBloc bloc) => bloc.state.filterOf(section));
    final page = context.select((HomeBloc bloc) => bloc.state.pageOf(carousel));
    final items = filter.apply(properties);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: title,
          filter: filter,
          onFilterChanged: (value) =>
              context.read<HomeBloc>().add(HomeFilterChanged(section, value)),
          onViewAll: () => context.pushPlaceholder(title),
        ),
        const SizedBox(height: 25),
        // The key rebuilds the pager (back to page 0) whenever the filter changes.
        PropertyCarousel(
          key: ValueKey(filter),
          properties: items,
          onPageChanged: (index) => context
              .read<HomeBloc>()
              .add(HomeCarouselPageChanged(carousel, index)),
          onPropertyTap: (property) => context.pushPlaceholder(property.title),
        ),
        const SizedBox(height: 16),
        Center(child: PageDots(count: items.length, index: page)),
      ],
    );
  }
}

/// Pager that shows one wide card with a peek of the next one.
class PropertyCarousel extends StatefulWidget {
  const PropertyCarousel({
    super.key,
    required this.properties,
    required this.onPageChanged,
    required this.onPropertyTap,
  });

  final List<Property> properties;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<Property> onPropertyTap;

  @override
  State<PropertyCarousel> createState() => _PropertyCarouselState();
}

class _PropertyCarouselState extends State<PropertyCarousel> {
  // 378px card + 10px gap on a 428px screen, as in the Figma layout.
  final _controller = PageController(viewportFraction: 0.9065);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 171,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.properties.length,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          final property = widget.properties[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: PropertyListCard(
              property: property,
              onTap: () => widget.onPropertyTap(property),
            ),
          );
        },
      ),
    );
  }
}
