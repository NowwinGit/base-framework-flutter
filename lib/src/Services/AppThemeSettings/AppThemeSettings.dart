import 'package:flutter/material.dart';
import '../../Services/Theme/AppTheme.dart';

List<AppThemeName> appThemeNames = [
      AppThemeName(name: 'Red', theme: 'Red'),
      AppThemeName(name: 'Orange', theme: 'Orange'),
      AppThemeName(name: 'Blue', theme: 'Blue'),
      AppThemeName(name: 'Green', theme: 'Green'),
      AppThemeName(name: 'Teal', theme: 'Teal'),
      AppThemeName(name: 'Yellow', theme: 'Yellow'),
      AppThemeName(name: 'Pink', theme: 'Pink'),
      AppThemeName(name: 'Indigo', theme: 'Indigo'),
      AppThemeName(name: 'Grey', theme: 'Grey'),
      AppThemeName(name: 'Brown', theme: 'Brown'),
      AppThemeName(name: 'Cyan', theme: 'Cyan'),
      AppThemeName(name: 'Lime', theme: 'Lime'),
      AppThemeName(name: 'Violet', theme: 'Violet'),
      AppThemeName(name: 'Purple', theme: 'Purple'),
      AppThemeName(name: 'Black', theme: 'Black'),
    ];

Map<String, AppTheme> appThemes = {
  'Red': AppTheme(
    primarySwatch: Colors.red,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Orange': AppTheme(
    primarySwatch: Colors.deepOrange,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Blue': AppTheme(
    primarySwatch: Colors.blue,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Green': AppTheme(
    primarySwatch: Colors.green,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Teal': AppTheme(
    primarySwatch: Colors.teal,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Yellow': AppTheme(
    primarySwatch: Colors.amber, //amber600
    primaryShade: 600,
    primaryTopBarText: Colors.blueGrey[700]!,
    primaryColorBrightness: Brightness.light,
  ),
  'Pink': AppTheme(
    primarySwatch: Colors.pink,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Indigo': AppTheme(
    primarySwatch: Colors.indigo, // 500
    primaryShade: 500,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Grey': AppTheme(
    primarySwatch: Colors.blueGrey, // BlueGray
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Brown': AppTheme(
    primarySwatch: Colors.brown,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Cyan': AppTheme(
    primarySwatch: Colors.cyan, //500
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.light,
  ),
  'Lime': AppTheme(
    primarySwatch: Colors.lightGreen, //500
    primaryShade: 400,
    primaryTopBarText: Colors.blueGrey[800]!,
    primaryColorBrightness: Brightness.light,
  ),
  'Violet': AppTheme(
    primarySwatch: Colors.purple,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Purple': AppTheme(
    primarySwatch: Colors.deepPurple,
    primaryShade: 400,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),
  'Black': AppTheme(
    primarySwatch: Colors.grey,
    primaryShade: 700,
    primaryTopBarText: Colors.white,
    primaryColorBrightness: Brightness.dark,
  ),

};
