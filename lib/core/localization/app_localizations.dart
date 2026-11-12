import 'package:flutter/material.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        const AppLocalizations(Locale('ar'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  bool get isArabic => locale.languageCode == 'ar';

  static final Map<String, Map<String, String>> _localizedValues = {
    'ar': {
      // App & Navigation
      'app_name': 'إمتلك',
      'search_placeholder': 'كيف يمكننا مساعدتك',
      'city_cairo': 'القاهرة',
      'city_giza': 'الجيزة',
      'city_alexandria': 'الأسكندرية',
      'nav_properties': 'عقاراتي',
      'nav_offers': 'العروض',
      'nav_home': 'الرئيسية',
      'nav_market': 'السوق',
      'nav_developers': 'المطورون',

      // Hero & Promo Banners
      'hero1_title': 'منزل احلامك الاَن متوفر',
      'hero1_subtitle':
          'مشروع كمبوند الشيخ زايد اكثر من 200 شقة ومحل في انتظارك',
      'hero_cta': 'تواصل الاَن',
      'hero2_title': 'مكتبك لازم يكون انيق',
      'hero2_subtitle':
          'مشروع كمبوند الشيخ زايد اكثر من 200 مكتب ومحل في انتظارك',

      // Section Titles
      'section_featured': 'عقارات مميزة',
      'section_projects': 'اهم المشاريع العقارية',
      'section_cities': 'إبحث عن عقارك بالمدينة',
      'section_apartments': 'أحدث الشقق',
      'section_villas': 'أحدث الفيلات',
      'section_duplexes': 'أحدث الدوبلكس',
      'section_news': 'اهم الأخبار',
      'view_all': 'مشاهدة الكل',

      // Filter Tabs
      'filter_all': 'الكل',
      'filter_sale': 'للبيع',
      'filter_rent': 'للإيجار',

      // Property Badges & Meta
      'featured_badge': 'مميز',
      'project_badge': 'مشروع',
      'for_sale': 'للبيع',
      'for_rent': 'للإيجار',
      'published_by': 'بواسطة',
      'currency': 'ج.م',
      'per_month': 'شهريا',
      'days_ago': 'منذ 4 ايام',
      'location_default': 'الشيخ زايد الجيزة',
      'sheikh_zayed_compound': 'كمبوند الشيخ زايد',
      'residential_apartment_desc': 'شقة سكنية للبيع تشطيب سوبر ...',
      'luxury_apartments_desc': 'شقق سكنية فاخرة ومطاعم تجار...',
      'villa_desc': 'فيلا سكنية للبيع تشطيب سوبر ...',
      'duplex_desc': 'دوبلكس سكني للبيع تشطيب سوبر ...',
      'news1_title': 'عقارات ومشاريع كمبوند الشيخ زايد',
      'news2_title': 'كيف تختار عقارك المناسب للاستثمار',
      'news_body': 'كمبوند الشيخ زايد يقدم عروض استثنائية...',

      // Drawer
      'drawer_user_name': 'عبدالله محمد',
      'drawer_user_location': 'القاهرة',
      'drawer_more': 'المزيد',
      'drawer_favorites': 'عقاراتي المفضلة',
      'drawer_notifications': 'الإشعارات',
      'drawer_messages': 'الدردشة',
      'drawer_add_property': 'أضف عقارك',
      'drawer_packages': 'شراء باقات',
      'drawer_projects': 'أحدث المشاريع',
      'drawer_help': 'مركز المساعده',
      'drawer_support': 'خدمة العملاء',
      'drawer_join': 'إنضم إلينا',
      'drawer_logout': 'تسجيل الخروج',
      'drawer_switch_language': 'English',
      'switch_lang_title': 'تغيير اللغة إلى English',

      // Misc
      'coming_soon': 'قريباً',
      'coming_soon_subtitle': 'هذه الصفحة قيد التطوير',
      'something_went_wrong': 'حدث خطأ ما',
      'retry': 'إعادة المحاولة',
      'logged_out': 'تم تسجيل الخروج',
    },
    'en': {
      // App & Navigation
      'app_name': 'Emtalik',
      'search_placeholder': 'How can we help you?',
      'city_cairo': 'Cairo',
      'city_giza': 'Giza',
      'city_alexandria': 'Alexandria',
      'nav_properties': 'My Properties',
      'nav_offers': 'Offers',
      'nav_home': 'Home',
      'nav_market': 'Market',
      'nav_developers': 'Developers',

      // Hero & Promo Banners
      'hero1_title': 'Your Dream Home is Available Now',
      'hero1_subtitle':
          'Sheikh Zayed Compound: Over 200 apartments & shops waiting for you',
      'hero_cta': 'Contact Now',
      'hero2_title': 'Your Office Needs To Be Elegant',
      'hero2_subtitle':
          'Sheikh Zayed Compound: Over 200 offices & retail spaces waiting for you',

      // Section Titles
      'section_featured': 'Featured Properties',
      'section_projects': 'Top Real Estate Projects',
      'section_cities': 'Search Properties by City',
      'section_apartments': 'Latest Apartments',
      'section_villas': 'Latest Villas',
      'section_duplexes': 'Latest Duplexes',
      'section_news': 'Latest News',
      'view_all': 'View All',

      // Filter Tabs
      'filter_all': 'All',
      'filter_sale': 'For Sale',
      'filter_rent': 'For Rent',

      // Property Badges & Meta
      'featured_badge': 'Featured',
      'project_badge': 'Project',
      'for_sale': 'For Sale',
      'for_rent': 'For Rent',
      'published_by': 'By',
      'currency': 'EGP',
      'per_month': 'Monthly',
      'days_ago': '4 days ago',
      'location_default': 'Sheikh Zayed, Giza',
      'sheikh_zayed_compound': 'Sheikh Zayed Compound',
      'residential_apartment_desc':
          'Residential apartment for sale super lux...',
      'luxury_apartments_desc':
          'Luxury apartments and commercial restaurants...',
      'villa_desc': 'Residential villa for sale super lux...',
      'duplex_desc': 'Residential duplex for sale super lux...',
      'news1_title': 'Real Estate & Sheikh Zayed Projects',
      'news2_title': 'How to Choose the Right Property for Investment',
      'news_body':
          'Sheikh Zayed Compound offers exceptional investment options...',

      // Drawer
      'drawer_user_name': 'Abdullah Mohamed',
      'drawer_user_location': 'Cairo',
      'drawer_more': 'More',
      'drawer_favorites': 'My Favorites',
      'drawer_notifications': 'Notifications',
      'drawer_messages': 'Chat & Messages',
      'drawer_add_property': 'Add Your Property',
      'drawer_packages': 'Buy Packages',
      'drawer_projects': 'Latest Projects',
      'drawer_help': 'Help Center',
      'drawer_support': 'Customer Support',
      'drawer_join': 'Join Us',
      'drawer_logout': 'Log Out',
      'drawer_switch_language': 'العربية',
      'switch_lang_title': 'Switch to Arabic',

      // Misc
      'coming_soon': 'Coming Soon',
      'coming_soon_subtitle': 'This page is under development',
      'something_went_wrong': 'Something went wrong',
      'retry': 'Retry',
      'logged_out': 'Logged out successfully',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['ar']?[key] ??
        key;
  }

  String propertiesForSale(int count) {
    return isArabic ? 'عقارات للبيع : $count' : 'Properties for sale : $count';
  }

  String propertiesForRent(int count) {
    return isArabic
        ? 'عقارات للإيجار : $count'
        : 'Properties for rent : $count';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
  String tr(String key) => AppLocalizations.of(this).translate(key);
}
