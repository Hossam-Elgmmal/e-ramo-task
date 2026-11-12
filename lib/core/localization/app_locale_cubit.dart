import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_emtalik/core/constants/app_strings.dart';

class LocaleState {
  const LocaleState(this.locale);

  final Locale locale;
  bool get isArabic => locale.languageCode == 'ar';
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit([Locale initialLocale = const Locale('ar')])
      : super(LocaleState(initialLocale)) {
    AppStrings.currentLocale = initialLocale;
  }

  void toggleLocale() {
    final nextLocale =
        state.isArabic ? const Locale('en') : const Locale('ar');
    setLocale(nextLocale);
  }

  void setLocale(Locale locale) {
    AppStrings.currentLocale = locale;
    emit(LocaleState(locale));
  }
}

