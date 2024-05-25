import 'package:flutter/material.dart';
import 'package:sos/theme/app_palette.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.whiteSmoke,
  );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 35, 35, 35),
  );
}
