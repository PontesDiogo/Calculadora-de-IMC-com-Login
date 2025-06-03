import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Inter',
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16),
      ),
    );
  }
}
