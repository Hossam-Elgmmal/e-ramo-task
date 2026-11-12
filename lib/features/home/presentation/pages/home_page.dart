import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/core/constants/app_dimens.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/core/localization/app_locale_cubit.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/home_data.dart';
import 'package:real_estate_emtalik/features/home/domain/repositories/home_repository.dart';
import 'package:real_estate_emtalik/features/home/presentation/bloc/home_bloc.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/banner_carousel.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/cities_section.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/emtalik_bottom_bar.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/featured_section.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/home_drawer.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/home_header.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/latest_properties_section.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/news_section.dart';
import 'package:real_estate_emtalik/features/home/presentation/widgets/projects_section.dart';

/// Provides [HomeBloc] and starts loading. Keep this thin; UI is in [HomeView].
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(repository: context.read<HomeRepository>())
        ..add(const HomeStarted()),
      child: BlocListener<LocaleCubit, LocaleState>(
        listener: (context, state) {
          context.read<HomeBloc>().add(const HomeStarted());
        },
        child: const HomeView(),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static String _labelOf(BottomBarItem item) => switch (item) {
        BottomBarItem.properties => AppStrings.navProperties,
        BottomBarItem.offers => AppStrings.navOffers,
        BottomBarItem.market => AppStrings.navMarket,
        BottomBarItem.developers => AppStrings.navDevelopers,
        BottomBarItem.home => '',
      };

  void _openDrawer() {
    // Always open from the RIGHT side
    if (Directionality.of(context) == TextDirection.rtl) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const HomeDrawer(),
      endDrawer: const HomeDrawer(),
      body: Column(
        children: [
          HomeHeader(onMenuTap: _openDrawer),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return switch (state.status) {
                  HomeStatus.initial ||
                  HomeStatus.loading =>
                    const Center(child: CircularProgressIndicator()),
                  HomeStatus.failure => _ErrorView(
                      onRetry: () =>
                          context.read<HomeBloc>().add(const HomeStarted()),
                    ),
                  HomeStatus.success => _HomeContent(data: state.data!),
                };
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: EmtalikBottomBar(
        onItemTap: (item) {
          if (item == BottomBarItem.home) return;
          context.pushPlaceholder(_labelOf(item));
        },
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.data});

  final HomeData data;

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[
      BannerSection(banners: data.heroBanners, carousel: HomeCarousel.hero),
      FeaturedSection(properties: data.featured),
      ProjectsSection(projects: data.projects),
      CitiesSection(cities: data.cities),
      BannerSection(banners: data.promoBanners, carousel: HomeCarousel.promo),
      LatestPropertiesSection(
        title: AppStrings.apartmentsTitle,
        section: HomeSection.apartments,
        carousel: HomeCarousel.apartments,
        properties: data.apartments,
      ),
      LatestPropertiesSection(
        title: AppStrings.villasTitle,
        section: HomeSection.villas,
        carousel: HomeCarousel.villas,
        properties: data.villas,
      ),
      LatestPropertiesSection(
        title: AppStrings.duplexesTitle,
        section: HomeSection.duplexes,
        carousel: HomeCarousel.duplexes,
        properties: data.duplexes,
      ),
      NewsSection(news: data.news),
    ];

    return ListView.separated(
      padding: const EdgeInsets.only(top: 24, bottom: 64),
      itemCount: sections.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppDimens.sectionGap),
      itemBuilder: (_, index) => sections[index],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppStrings.somethingWentWrong),
          const SizedBox(height: 12),
          FilledButton(onPressed: onRetry, child: Text(AppStrings.retry)),
        ],
      ),
    );
  }
}
