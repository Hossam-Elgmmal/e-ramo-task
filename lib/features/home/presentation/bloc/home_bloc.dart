import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/home_data.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeCarouselPageChanged>(_onCarouselPageChanged);
    on<HomeFilterChanged>(_onFilterChanged);
  }

  final HomeRepository _repository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final data = await _repository.fetchHome();
      emit(state.copyWith(status: HomeStatus.success, data: data));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  void _onCarouselPageChanged(
    HomeCarouselPageChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(
      state.copyWith(
        carouselPages: {...state.carouselPages, event.carousel: event.page},
      ),
    );
  }

  void _onFilterChanged(HomeFilterChanged event, Emitter<HomeState> emit) {
    // Changing a filter shrinks/reorders the list, so reset its pager to page 0.
    final carousel = switch (event.section) {
      HomeSection.featured => null,
      HomeSection.apartments => HomeCarousel.apartments,
      HomeSection.villas => HomeCarousel.villas,
      HomeSection.duplexes => HomeCarousel.duplexes,
    };
    emit(
      state.copyWith(
        filters: {...state.filters, event.section: event.filter},
        carouselPages: carousel == null
            ? state.carouselPages
            : {...state.carouselPages, carousel: 0},
      ),
    );
  }
}
