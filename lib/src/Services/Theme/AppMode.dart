import 'package:flutter/material.dart';

class AppMode {
  Color? scrollbarTrackColor;
  Color? scaffoldBackgroundColor;
  Color cardThemeColor;
  Color headingColor;
  Color textColor;
  Color buttonColor;

  AppMode({
    this.scrollbarTrackColor,
    this.scaffoldBackgroundColor,
    required this.cardThemeColor,
    required this.headingColor,
    required this.textColor,
    required this.buttonColor,
  });
}