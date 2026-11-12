part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => const [];
}

/// Loads (or reloads) the home data.
final class HomeStarted extends HomeEvent {
  const HomeStarted();
}

/// A banner/list pager settled on a new page (drives the page dots).
final class HomeCarouselPageChanged extends HomeEvent {
  const HomeCarouselPageChanged(this.carousel, this.page);

  final HomeCarousel carousel;
  final int page;

  @override
  List<Object?> get props => [carousel, page];
}

/// The user tapped "الكل / للبيع / للإيجار" above a property list.
final class HomeFilterChanged extends HomeEvent {
  const HomeFilterChanged(this.section, this.filter);

  final HomeSection section;
  final ListingFilter filter;

  @override
  List<Object?> get props => [section, filter];
}
