import 'package:flutter/material.dart';
import '../../Services/AppFontSettings/app_font_settings.dart';
import '../../Services/AppModeSettings/AppModeSettings.dart';
import '../../Services/Theme/AppMode.dart';
import '../../Services/Theme/AppTheme.dart';
import '../../Constants/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constants/constants.dart';
import '../../Services/AppThemeSettings/AppThemeSettings.dart';

class ThemeProvider extends ChangeNotifier {
  SharedPreferences? _pref;
  String _theme = defaultThemeName;
  String _mode = defaultMode;
  String _topbar = defaultTopBar;
  String _menu = defaultMenu;
  int _bgSkin = defaultBGSkin;

  ThemeProvider() {
    _theme = defaultThemeName;
    _mode = defaultMode;
    _topbar = defaultTopBar;
    _bgSkin = defaultBGSkin;
    _menu = defaultMenu;
    loadPreferrences();
  }

  buildTheme(BuildContext context) {
    return generateTheme(context, _theme, _mode, _topbar, _menu);
  }

  ThemeData generateTheme(BuildContext context, String _theme, String _mode, String _topbar, String _menu) {
    // App Mode
    Brightness brightness = ((defaultMode == "light") ? Brightness.light : Brightness.dark);

    if (_mode == "light")
      brightness = Brightness.light;
    else
      brightness = Brightness.dark;

    // Top Bar
    Color themePrimaryColor = appThemes[_theme]!.primarySwatch[appThemes[_theme]!.primaryShade]!;
    Color primaryTopBarText = appThemes[_theme]!.primaryTopBarText;
    Color topBarColor = ((defaultTopBar == "light") ? sTopBarLight : (((defaultTopBar == "dark") ? sTopBarDark : themePrimaryColor)));
    Color topBarTextColor = ((defaultTopBar == "light") ? sTopBarLightText : (((defaultTopBar == "dark") ? sTopBarDarkText : primaryTopBarText)));

    if (_topbar == "light") {
      topBarColor = sTopBarLight;
      topBarTextColor = sTopBarLightText;
    } else if (_topbar == "dark") {
      topBarColor = sTopBarDark;
      topBarTextColor = sTopBarDarkText;
    } else if (_topbar == "primary") {
      topBarColor = themePrimaryColor;
      topBarTextColor = primaryTopBarText; //Theme.of(context).primaryTextTheme.headline6.color;
    }

    // Menu
    Color menuColor = ((defaultMenu == "light") ? sMenuLight : (((defaultMenu == "dark") ? sMenuDark : themePrimaryColor)));

    if (_menu == "light") {
      menuColor = sMenuLight;
    } else if (_menu == "dark") {
      menuColor = sMenuDark;
    } else if (_menu == "primary") {
      menuColor = themePrimaryColor;
    }

    AppTheme apptheme = appThemes[_theme]!;
    AppMode appmode = appModes[_mode]!;

    // Generate ThemeData
    return ThemeData(
      primaryColorBrightness: apptheme.primaryColorBrightness,
      primarySwatch: apptheme.primarySwatch,
      primaryColor: themePrimaryColor,
      brightness: brightness,
      scaffoldBackgroundColor: appmode.scaffoldBackgroundColor,
      canvasColor: menuColor, //appmode.canvasColor,
      cardTheme: CardTheme(color: appmode.cardThemeColor),

      appBarTheme: AppBarTheme(
        backgroundColor: topBarColor,
        iconTheme: IconThemeData(
          color: topBarTextColor,
        ),
        toolbarTextStyle: TextTheme(
          bodyText2: TextStyle(
            color: topBarTextColor.withOpacity(0.9),
            fontFamily: appFont.bodyFont,
            fontSize: appFont.body2Size,
            height: 1.1, //appFont.body2Height,
            fontWeight: appFont.body2Weight,
          ),
          headline6: TextStyle(
            color: topBarTextColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h6Size,
            height: 1.1, //appFont.h6Height,
            fontWeight: appFont.h6Weight,
          ),
        ).bodyText2,
        titleTextStyle: TextTheme(
          bodyText2: TextStyle(
            color: topBarTextColor.withOpacity(0.9),
            fontFamily: appFont.bodyFont,
            fontSize: appFont.body2Size,
            height: 1.1, //appFont.body2Height,
            fontWeight: appFont.body2Weight,
          ),
          headline6: TextStyle(
            color: topBarTextColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h6Size,
            height: 1.1, //appFont.h6Height,
            fontWeight: appFont.h6Weight,
          ),
        ).headline6,
      ),

      textTheme: TextTheme(
        headline1: TextStyle(
            color: appmode.headingColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h1Size,
            height: appFont.h1Height,
            fontWeight: appFont.h1Weight),
        headline2: TextStyle(
            color: appmode.headingColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h2Size,
            height: appFont.h2Height,
            fontWeight: appFont.h2Weight),
        headline3: TextStyle(
            color: appmode.headingColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h3Size,
            height: appFont.h3Height,
            fontWeight: appFont.h3Weight),
        headline4: TextStyle(
            color: appmode.headingColor,
            fontFamily: appFont.headingFont,
            fontSize: appFont.h4Size,
            height: appFont.h4Height,
            fontWeight: appFont.h4Weight),
        headline5: TextStyle(
          color: appmode.textColor,
          fontFamily: appFont.bodyFont,
          fontSize: appFont.h5Size,
          height: appFont.h5Height,
          fontWeight: appFont.h5Weight,
        ),
        headline6: TextStyle(
          color: appmode.textColor,
          fontFamily: appFont.bodyFont,
          fontSize: appFont.h6Size,
          height: appFont.h6Height,
          fontWeight: appFont.h6Weight,
        ),
        bodyText1: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.body1Size,
            height: appFont.body1Height,
            fontWeight: appFont.body1Weight),
        bodyText2: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.body2Size,
            height: appFont.body2Height,
            fontWeight: appFont.body2Weight),
        subtitle1: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.subtitle1Size,
            height: appFont.subtitle1Height,
            fontWeight: appFont.subtitle1Weight),
        subtitle2: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.subtitle2Size,
            height: appFont.subtitle2Height,
            fontWeight: appFont.subtitle2Weight),
        overline: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.overlineSize,
            height: appFont.overlineHeight,
            fontWeight: appFont.overlineWeight),
        caption: TextStyle(
            color: appmode.textColor,
            fontFamily: appFont.bodyFont,
            fontSize: appFont.captionSize,
            height: appFont.captionHeight,
            fontWeight: appFont.captionWeight),
        button: TextStyle(
            color: appmode.buttonColor,
            fontFamily: appFont.buttonFont,
            fontSize: appFont.buttonSize,
            height: appFont.buttonHeight,
            fontWeight: appFont.buttonWeight),
      ),
    );
  }

  changeTheme(String t) {
    _theme = t;
    savePreferrences("theme");
    notifyListeners();
  }

  changeBrightness(String b) {
    _mode = b;
    savePreferrences("mode");

    // Chnage topbar based on mode
    if (linkTopBarWithMode == true) {
      _topbar = b;
      savePreferrences("topbar");
    }

    // Chnage menu based on mode
    if (linkMenuWithMode == true) {
      _menu = b;
      savePreferrences("menu");
    }

    notifyListeners();
  }

  changeTopBar(String tb) {
    _topbar = tb;
    savePreferrences("topbar");
    notifyListeners();
  }

  changeMenu(String m) {
    _menu = m;
    savePreferrences("menu");
    notifyListeners();
  }

  buildBGSkin(BuildContext context) {
    return createBGSkin(context, _bgSkin);
  }

  int createBGSkin(BuildContext context, int _bgSkin) {
    return _bgSkin;
  }

  changeBGSkin(int s) {
    _bgSkin = s;
    savePreferrences("bgSkin");
    notifyListeners();
  }

  initializePreferrences() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
    // _pref!.clear();
  }

  loadPreferrences() async {
    await initializePreferrences();
    _theme = _pref!.getString("theme") ?? defaultThemeName;
    _mode = _pref!.getString("mode") ?? defaultMode;
    _topbar = _pref!.getString("topbar") ?? defaultTopBar;
    _menu = _pref!.getString("menu") ?? defaultMenu;
    _bgSkin = _pref!.getInt("bgSkin") ?? defaultBGSkin;
    notifyListeners();
  }

  savePreferrences(String key) async {
    // _pref.clear();
    await initializePreferrences();
    if (key == "theme") {
      _pref!.setString("theme", _theme);
    } else if (key == "mode") {
      _pref!.setString("mode", _mode);
    } else if (key == "topbar") {
      _pref!.setString("topbar", _topbar);
    } else if (key == "menu") {
      _pref!.setString("menu", _menu);
    } else if (key == "bgSkin") {
      _pref!.setInt("bgSkin", _bgSkin);
    }
  }
}
