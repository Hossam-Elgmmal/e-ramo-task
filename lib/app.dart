import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:real_estate_emtalik/core/localization/app_locale_cubit.dart';
import 'package:real_estate_emtalik/core/localization/app_localizations.dart';
import 'package:real_estate_emtalik/core/router/app_router.dart';
import 'package:real_estate_emtalik/core/theme/app_theme.dart';
import 'package:real_estate_emtalik/features/home/data/repositories/mock_home_repository.dart';
import 'package:real_estate_emtalik/features/home/domain/repositories/home_repository.dart';

class EmtalikApp extends StatelessWidget {
  const EmtalikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
      ],
      child: RepositoryProvider<HomeRepository>(
        create: (_) => const MockHomeRepository(),
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp(
              title: 'Emtalik',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              locale: localeState.locale,
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              initialRoute: AppRoutes.home,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
