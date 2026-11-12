import 'package:flutter/material.dart';

/// UI strings supporting both Arabic and English text across the app.
abstract final class AppStrings {
  static Locale currentLocale = const Locale('ar');
  static bool get isArabic => currentLocale.languageCode == 'ar';

  static String get searchHint => isArabic ? 'كيف يمكننا مساعدتك' : 'How can we help you?';
  static String get city => isArabic ? 'القاهرة' : 'Cairo';
  static String get viewAll => isArabic ? 'مشاهدة الكل' : 'View all';

  static String get featuredTitle => isArabic ? 'عقارات مميزة' : 'Featured Properties';
  static String get projectsTitle => isArabic ? 'اهم المشاريع العقارية' : 'Top Real Estate Projects';
  static String get citiesTitle => isArabic ? 'إبحث عن عقارك بالمدينة' : 'Search Properties by City';
  static String get apartmentsTitle => isArabic ? 'أحدث الشقق' : 'Latest Apartments';
  static String get villasTitle => isArabic ? 'أحدث الفيلات' : 'Latest Villas';
  static String get duplexesTitle => isArabic ? 'أحدث الدوبلكس' : 'Latest Duplexes';
  static String get newsTitle => isArabic ? 'اهم الأخبار' : 'Latest News';

  static String get filterAll => isArabic ? 'الكل' : 'All';
  static String get filterSale => isArabic ? 'للبيع' : 'For Sale';
  static String get filterRent => isArabic ? 'للإيجار' : 'For Rent';

  static String get forSale => isArabic ? 'للبيع' : 'For Sale';
  static String get forRent => isArabic ? 'للإيجار' : 'For Rent';
  static String get featuredBadge => isArabic ? 'مميز' : 'Featured';
  static String get projectBadge => isArabic ? 'مشروع' : 'Project';
  static String get publishedBy => isArabic ? 'بواسطة' : 'By';
  static String get currency => isArabic ? 'ج.م' : 'EGP';
  static String get perMonth => isArabic ? 'شهريا' : 'Monthly';

  static String get navProperties => isArabic ? 'عقاراتي' : 'Properties';
  static String get navOffers => isArabic ? 'العروض' : 'Offers';
  static String get navMarket => isArabic ? 'السوق' : 'Market';
  static String get navDevelopers => isArabic ? 'المطورون' : 'Developers';

  static String get comingSoon => isArabic ? 'قريباً' : 'Coming Soon';
  static String get comingSoonSubtitle => isArabic ? 'هذه الصفحة قيد التطوير' : 'This page is under development';
  static String get somethingWentWrong => isArabic ? 'حدث خطأ ما' : 'Something went wrong';
  static String get retry => isArabic ? 'إعادة المحاولة' : 'Retry';

  static String propertiesForSale(int count) =>
      isArabic ? 'عقارات للبيع : $count' : 'Properties for sale : $count';
  static String propertiesForRent(int count) =>
      isArabic ? 'عقارات للإيجار : $count' : 'Properties for rent : $count';
}
