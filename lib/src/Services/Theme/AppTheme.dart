import 'package:flutter/material.dart';

class AppTheme {
  final MaterialColor primarySwatch;
  final int primaryShade;
  final Color primaryTopBarText;
  final Brightness primaryColorBrightness;

  AppTheme({
    required this.primarySwatch,
    required this.primaryShade,
    required this.primaryTopBarText,
    required this.primaryColorBrightness,
  });
}


class AppThemeName{
  final String? name;
  final String? theme;

  AppThemeName({
    required this.name,
    required this.theme,
  });
}
