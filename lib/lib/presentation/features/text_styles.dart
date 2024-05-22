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
}
