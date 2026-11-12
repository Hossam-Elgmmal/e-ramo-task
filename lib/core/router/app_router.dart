import 'package:flutter/material.dart';
import 'package:real_estate_emtalik/features/home/presentation/pages/home_page.dart';
import 'package:real_estate_emtalik/features/placeholder/presentation/pages/placeholder_page.dart';

abstract final class AppRoutes {
  static const home = '/';
  static const placeholder = '/placeholder';
}

abstract final class AppRouter {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case AppRoutes.placeholder:
        final title = settings.arguments as String? ?? '';
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => PlaceholderPage(title: title),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const PlaceholderPage(title: ''),
        );
    }
  }
}

extension PlaceholderNavigation on BuildContext {
  /// Every tappable element on the home screen goes to the placeholder screen.
  Future<void> pushPlaceholder(String title) {
    return Navigator.of(this).pushNamed<void>(
      AppRoutes.placeholder,
      arguments: title,
    );
  }
}
