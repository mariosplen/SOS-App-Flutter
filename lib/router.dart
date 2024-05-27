import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos/models/country_model.dart';
import 'package:sos/presentation/features/countries/countries_page.dart';
import 'package:sos/presentation/features/country_detail/country_detail_page.dart';
import 'package:sos/presentation/features/home/home_page.dart';
import 'package:sos/presentation/features/map/map_page.dart';
import 'package:sos/presentation/features/settings/settings_page.dart';
import 'package:sos/presentation/features/settings/settings_set/about_page.dart';
import 'package:sos/presentation/features/settings/settings_set/language_page.dart';
import 'package:sos/presentation/features/settings/settings_set/terms_page.dart';
import 'package:sos/presentation/features/settings/settings_set/theme_page.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
      ),
      GoRoute(
        path: "/map",
        pageBuilder: (context, state) => const MaterialPage(child: MapPage()),
      ),
      GoRoute(
        path: "/countries",
        pageBuilder: (context, state) =>
            const MaterialPage(child: CountriesPage()),
      ),
      GoRoute(
        path: "/country-detail",
        pageBuilder: (context, state) {
          final params = state.extra as Map<String, dynamic>?;
          final country = params?['country'] as Country?;
          final countries = params?['countries'] as List<Country>?;
          return MaterialPage(
            child:
                CountryDetailPage(country: country, countries: countries ?? []),
          );
        },
      ),
      GoRoute(
        path: "/settings",
        pageBuilder: (context, state) => const MaterialPage(
          child: SettingsPage(),
        ),
      ),
      GoRoute(
        path: "/settings/language",
        pageBuilder: (context, state) => const MaterialPage(
          child: LanguagePage(),
        ),
      ),
      GoRoute(
        path: "/settings/theme",
        pageBuilder: (context, state) => const MaterialPage(
          child: ThemePage(),
        ),
      ),
      GoRoute(
        path: "/settings/about",
        pageBuilder: (context, state) => const MaterialPage(
          child: AboutPage(),
        ),
      ),
      GoRoute(
        path: "/settings/terms",
        pageBuilder: (context, state) => const MaterialPage(
          child: TermsPage(),
        ),
      ),
    ],
  );
}
