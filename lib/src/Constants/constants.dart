import 'dart:io';
import 'package:flutter/material.dart';

Platform platform = Platform();
double? deviceWidth;
double? deviceHeight;
double? deviceShortestSide;
Orientation? deviceOrientation;

double menuWidth = deviceWidth!; // deviceWidth * 0.6;
double menuWidthDesktop = 400;
double menuWidthTablet = deviceWidth!;
bool hideScaffoldAppBar = true;

String appVersion = '1.0.0';
String appContactEmail = 'email@example.com';

String defaultThemeName = 'Blue';
String defaultMode = 'light';
String defaultTopBar = 'primary';
String defaultMenu = 'light';

Map<int, Map<String, dynamic>> bgSkins = {};
int defaultBGSkin = 1;

// Widgets-AppBackground2
// String appBackground = "box"; //  "", box, inverted_box. Default "".
double appBackgroundRadius = 10.0; 
double appBackgroundHeight = 200.0;
double appBackgroundElevation = 3;
double appBarElevation = 1; // Default 4.

// App Settings - Change Top Bar and Menu with App Mode
bool linkTopBarWithMode = false;
bool linkMenuWithMode = true;
bool addTimeZoneOffset = false;
bool showInShortTimeDifference = true;

List<String> pageHeaderIcons = ["avatar", "settings"];
Map<String, IconData> pageHeaderIconData = {};
Map<String, String> pageHeaderIconsPage = {};

const bool enableFormValidation = true;

const bool enableFadeInNetworkImages = false;
const String networkImageDirectoryURL = "";

const String apiURL = "";
const String apiLocalDomain = "";
const String apiLocalIP = "";
