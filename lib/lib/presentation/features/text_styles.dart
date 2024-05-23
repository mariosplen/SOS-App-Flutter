import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle titleStyleBlack = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600, // 600 corresponds to SemiBold
    fontSize: 20,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle titleStyleWhite = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w800, // 800 corresponds to Bold
    fontSize: 20,
    color: Colors.white,
  );

  static const TextStyle dispatchButtonStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w900, // 900 corresponds to Black
    fontSize: 48,
    color: Color.fromARGB(255, 255, 255, 255),
  );

  static const TextStyle buttonStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: Color.fromARGB(255, 0, 0, 0),
  );

  static const TextStyle settingsTitleStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: Color.fromARGB(255, 61, 61, 61),
    fontWeight: FontWeight.w400,
  );

  static const TextStyle settingsDescStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    color: Color.fromARGB(255, 90, 90, 90),
    fontWeight: FontWeight.w200, //extralight
  );
}
