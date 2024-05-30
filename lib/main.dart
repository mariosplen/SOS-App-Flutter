import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sos/blocs/settings/settings_bloc.dart';
import 'package:sos/gen/translations/codegen_loader.g.dart';
import 'package:sos/models/theme_type.dart';
import 'package:sos/router.dart';
import 'package:sos/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        path: 'lib/assets/translations',
        supportedLocales: const [Locale('en'), Locale('el'), Locale('ru')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: Phoenix(child: MyApp()),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(const Init()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return state.isLoaded
              ? MaterialApp.router(
                  title: 'GlobalHelp',
                  debugShowCheckedModeBanner: false,
                  theme: getTheme(context, state.themeMode),
                  routerConfig: _router,
                  supportedLocales: context.supportedLocales,
                  localizationsDelegates: [
                    ...context.localizationDelegates,
                    const LocaleNamesLocalizationsDelegate(),
                  ],
                  locale: context.locale,
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

ThemeData getTheme(BuildContext ctx, int themeMode) {
  switch (ThemeType.values[themeMode]) {
    case ThemeType.system:
      return isSystemDarkTheme(ctx)
          ? AppTheme.darkThemeMode
          : AppTheme.lightThemeMode;
    case ThemeType.dark:
      return AppTheme.darkThemeMode;
    default:
      return AppTheme.lightThemeMode;
  }
}

bool isSystemDarkTheme(BuildContext ctx) {
  var brightness = MediaQuery.of(ctx).platformBrightness;
  return brightness == Brightness.dark;
}
