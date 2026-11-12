part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

/// Every pager on the screen that shows page dots.
enum HomeCarousel { hero, promo, apartments, villas, duplexes }

/// Every property list that has an "all / sale / rent" filter.
enum HomeSection { featured, apartments, villas, duplexes }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.data,
    this.carouselPages = const {},
    this.filters = const {},
  });

  final HomeStatus status;
  final HomeData? data;
  final Map<HomeCarousel, int> carouselPages;
  final Map<HomeSection, ListingFilter> filters;

  int pageOf(HomeCarousel carousel) => carouselPages[carousel] ?? 0;

  ListingFilter filterOf(HomeSection section) =>
      filters[section] ?? ListingFilter.all;

  HomeState copyWith({
    HomeStatus? status,
    HomeData? data,
    Map<HomeCarousel, int>? carouselPages,
    Map<HomeSection, ListingFilter>? filters,
  }) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      carouselPages: carouselPages ?? this.carouselPages,
      filters: filters ?? this.filters,
    );
  }

  @override
  List<Object?> get props => [status, data, carouselPages, filters];
}
