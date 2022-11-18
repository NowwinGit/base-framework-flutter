import 'package:flutter/material.dart';
import '../../Services/Theme/AppMode.dart';

Map<String, AppMode> appModes = {
  'light': AppMode(
    scaffoldBackgroundColor: Colors.grey[100]!,
    scrollbarTrackColor: Colors.grey[300]!,
    // canvasColor: Colors.white,
    cardThemeColor: Colors.white,
    headingColor: Colors.blueGrey[800]!,
    textColor: Colors.blueGrey[900]!,
    buttonColor: Colors.white,
  ),
  'dark': AppMode(
    scaffoldBackgroundColor: Colors.blueGrey[900]!,
    scrollbarTrackColor: Colors.blueGrey[700]!,
    // canvasColor: Colors.blueGrey[800]!,
    cardThemeColor: Colors.blueGrey[800]!,
    headingColor: Colors.blueGrey[200]!,
    textColor: Colors.blueGrey[100]!,
    buttonColor: Colors.white,
  ),
};