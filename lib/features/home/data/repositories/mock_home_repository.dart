import 'package:real_estate_emtalik/core/constants/app_assets.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/city_stats.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/home_data.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/news_item.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/project.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/promo_banner.dart';
import 'package:real_estate_emtalik/features/home/domain/entities/property.dart';
import 'package:real_estate_emtalik/features/home/domain/repositories/home_repository.dart';

/// Static data copied from the Figma design with Arabic/English text support.
class MockHomeRepository implements HomeRepository {
  const MockHomeRepository();

  static String get _location =>
      AppStrings.isArabic ? 'الشيخ زايد الجيزة' : 'Sheikh Zayed, Giza';
  static String get _posted =>
      AppStrings.isArabic ? 'منذ 4 ايام' : '4 days ago';

  @override
  Future<HomeData> fetchHome() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final isAr = AppStrings.isArabic;

    final aptDesc = isAr
        ? 'شقة سكنية للبيع تشطيب سوبر ...'
        : 'Residential apartment for sale super lux...';
    final villaDesc = isAr
        ? 'فيلا سكنية للبيع تشطيب سوبر ...'
        : 'Residential villa for sale super lux...';
    final duplexDesc = isAr
        ? 'دوبلكس سكني للبيع تشطيب سوبر ...'
        : 'Residential duplex for sale super lux...';

    return HomeData(
      heroBanners: _banners(
        prefix: 'hero',
        title: isAr
            ? 'منزل احلامك الاَن متوفر'
            : 'Your Dream Home is Available Now',
        subtitle: isAr
            ? 'مشروع كمبوند الشيخ زايد اكثر من 200 شقة ومحل في انتظارك'
            : 'Sheikh Zayed Compound: Over 200 apartments & shops waiting for you',
        actionLabel: isAr ? 'تواصل الاَن' : 'Contact Now',
        image: AppAssets.bannerHero,
      ),
      featured: [
        _property(
          'f1',
          aptDesc,
          ListingType.rent,
          AppAssets.property1,
          featured: true,
        ),
        _property(
          'f2',
          aptDesc,
          ListingType.sale,
          AppAssets.property2,
          featured: true,
        ),
        _property(
          'f3',
          aptDesc,
          ListingType.rent,
          AppAssets.property1,
          featured: true,
        ),
        _property(
          'f4',
          aptDesc,
          ListingType.sale,
          AppAssets.property2,
          featured: true,
        ),
      ],
      projects: [
        Project(
          id: 'p1',
          name: isAr ? 'كمبوند الشيخ زايد' : 'Sheikh Zayed Compound',
          description: isAr
              ? 'شقق سكنية فاخرة ومطاعم تجار...'
              : 'Luxury apartments and commercial restaurants...',
          location: _location,
          postedAgo: _posted,
          imageAsset: AppAssets.project1,
        ),
        Project(
          id: 'p2',
          name: isAr ? 'كمبوند الشيخ زايد' : 'Sheikh Zayed Compound',
          description: isAr
              ? 'شقق سكنية فاخرة ومطاعم تجار...'
              : 'Luxury apartments and commercial restaurants...',
          location: _location,
          postedAgo: _posted,
          imageAsset: AppAssets.project2,
        ),
      ],
      cities: [
        CityStats(
          name: isAr ? 'القاهرة' : 'Cairo',
          forSaleCount: 505,
          forRentCount: 1002,
          imageAsset: AppAssets.cityCairo,
        ),
        CityStats(
          name: isAr ? 'الجيزة' : 'Giza',
          forSaleCount: 505,
          forRentCount: 1002,
          imageAsset: AppAssets.cityGiza,
        ),
        CityStats(
          name: isAr ? 'الأسكندرية' : 'Alexandria',
          forSaleCount: 505,
          forRentCount: 1002,
          imageAsset: AppAssets.cityAlexandria,
        ),
      ],
      promoBanners: _banners(
        prefix: 'promo',
        title: isAr ? 'مكتبك لازم يكون انيق' : 'Your Office Needs To Be Elegant',
        subtitle: isAr
            ? 'مشروع كمبوند الشيخ زايد اكثر من 200 مكتب ومحل في انتظارك'
            : 'Sheikh Zayed Compound: Over 200 offices & retail spaces waiting for you',
        actionLabel: isAr ? 'تواصل الاَن' : 'Contact Now',
        image: AppAssets.bannerOffice,
      ),
      apartments: [
        _property('a1', aptDesc, ListingType.rent, AppAssets.property2),
        _property('a2', aptDesc, ListingType.sale, AppAssets.property2),
        _property('a3', aptDesc, ListingType.rent, AppAssets.property2),
        _property('a4', aptDesc, ListingType.sale, AppAssets.property2),
      ],
      villas: [
        _property('v1', villaDesc, ListingType.rent, AppAssets.villa1),
        _property('v2', villaDesc, ListingType.sale, AppAssets.villa2),
        _property('v3', villaDesc, ListingType.rent, AppAssets.villa1),
        _property('v4', villaDesc, ListingType.sale, AppAssets.villa2),
      ],
      duplexes: [
        _property('d1', duplexDesc, ListingType.rent, AppAssets.duplex1),
        _property('d2', duplexDesc, ListingType.sale, AppAssets.duplex2),
        _property('d3', duplexDesc, ListingType.rent, AppAssets.duplex1),
        _property('d4', duplexDesc, ListingType.sale, AppAssets.duplex2),
      ],
      news: [
        NewsItem(
          id: 'n1',
          title: isAr
              ? 'عقارات ومشاريع كمبوند الشيخ زايد'
              : 'Real Estate & Sheikh Zayed Projects',
          body: isAr
              ? 'كمبوند الشيخ زايد يقدم عروض استثنائية...'
              : 'Sheikh Zayed Compound offers exceptional investment options...',
          imageAsset: AppAssets.news1,
        ),
        NewsItem(
          id: 'n2',
          title: isAr
              ? 'كيف تختار عقارك المناسب للاستثمار'
              : 'How to Choose the Right Property for Investment',
          body: isAr
              ? 'كمبوند الشيخ زايد يقدم عروض استثنائية...'
              : 'Sheikh Zayed Compound offers exceptional investment options...',
          imageAsset: AppAssets.news2,
        ),
      ],
    );
  }

  static List<PromoBanner> _banners({
    required String prefix,
    required String title,
    required String subtitle,
    required String image,
    required String actionLabel,
  }) {
    return List.generate(
      4,
      (i) => PromoBanner(
        id: '$prefix-$i',
        title: title,
        subtitle: subtitle,
        actionLabel: actionLabel,
        imageAsset: image,
      ),
    );
  }

  static Property _property(
    String id,
    String title,
    ListingType type,
    String image, {
    bool featured = false,
  }) {
    return Property(
      id: id,
      title: title,
      price: type == ListingType.rent ? 25000 : 3500000,
      type: type,
      bedrooms: 4,
      bathrooms: 2,
      areaSqft: 1800,
      location: _location,
      postedAgo: _posted,
      imageAsset: image,
      isFeatured: featured,
    );
  }
}
