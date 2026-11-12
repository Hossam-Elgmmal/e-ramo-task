import 'package:equatable/equatable.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/city_stats.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/news_item.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/project.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/promo_banner.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';

/// Everything the home screen needs, in one immutable snapshot.
class HomeData extends Equatable {
  const HomeData({
    required this.heroBanners,
    required this.featured,
    required this.projects,
    required this.cities,
    required this.promoBanners,
    required this.apartments,
    required this.villas,
    required this.duplexes,
    required this.news,
  });

  final List<PromoBanner> heroBanners;
  final List<Property> featured;
  final List<Project> projects;
  final List<CityStats> cities;
  final List<PromoBanner> promoBanners;
  final List<Property> apartments;
  final List<Property> villas;
  final List<Property> duplexes;
  final List<NewsItem> news;

  @override
  List<Object?> get props => [
        heroBanners,
        featured,
        projects,
        cities,
        promoBanners,
        apartments,
        villas,
        duplexes,
        news,
      ];
}
