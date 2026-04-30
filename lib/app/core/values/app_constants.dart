import 'package:flutter/material.dart';

abstract class AppConstants {
  static const String appName = 'KFS Governorate';
  static const Locale defaultLocale = Locale('ar', 'EG');
  static const Locale fallbackLocale = Locale('ar', 'EG');
  static const List<Locale> supportedLocales = [
    Locale('ar', 'EG'),
    Locale('en', 'US'),
  ];
}
