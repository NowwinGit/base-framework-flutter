import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sample_base_framework/src/widget/AppBackground/app_background.dart';
import 'package:sample_base_framework/src/widget/CustomAppBar/custom_app_bar.dart';
import '../../Constants/style.dart';
import '../../Services/Languages/Languages.dart';
import '../../Services/Theme/ThemeProvider.dart';
import '../../Services/Responsive/Responsive.dart';
import 'dart:ui' as ui;
import '../../Constants/constants.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final String menu;
  final bool? settings;
  final String backbutton;
  final bool? showAppBar;
  final bool hasTabs;
  final int tabsLength;
  final bool? showFAB;
  final Function? onPressFAB;
  final IconData? iconFAB;
  final Color? colorFAB;
  final List<Widget>? topBarActions;
  final List<Widget>? topBarLeadingActions;
  final bool? centerAlignAppBar;
  final double? appBarleadingWidth;
  final bool? showSettingsMenu;
  final bool? invisibleAppBar;
  final bool? confirmAppExit;
  final Function? onTapTitle;
  final Color? backGroundColor;

  AppScaffold({
    this.title = "",
    required this.body,
    this.menu = "",
    this.settings = false,
    this.backbutton = "",
    this.showAppBar,
    this.hasTabs = false,
    this.tabsLength = 0,
    this.showFAB = false,
    this.onPressFAB,
    this.iconFAB,
    this.colorFAB,
    this.topBarActions,
    this.topBarLeadingActions,
    this.centerAlignAppBar = false,
    this.appBarleadingWidth,
    this.showSettingsMenu = false,
    this.invisibleAppBar = false,
    this.confirmAppExit = false,
    this.onTapTitle,
    this.backGroundColor,
  });

  // Future<bool> _onWillPop() async {
  //   return (await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //       title: new Text('Are you sure?'),
  //       content: new Text('Do you want to exit an App'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: new Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           child: new Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   )) ?? false;
  // }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    deviceOrientation = MediaQuery.of(context).orientation;
    deviceShortestSide = MediaQuery.of(context).size.shortestSide;

    TextDirection languageDirection;

    // Locale myLocale = Localizations.localeOf(context);
    bool rtl = (Directionality.of(context) == TextDirection.rtl);

    if (rtl) {
      languageDirection = ui.TextDirection.rtl;
    } else {
      languageDirection = ui.TextDirection.ltr;
    }

    Scaffold scaffold;
    Widget widget;

    if (showAppBar == false) {
      scaffold = Scaffold(
        extendBodyBehindAppBar: true,
       // backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,
        body: body,
      );

      widget = scaffold;
    } else {
      scaffold = Scaffold(
          extendBodyBehindAppBar: true,
       // backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,
        // Code to remove full width app bar in desktop mode
        appBar: ((Responsive().deviceType() != "desktop" && invisibleAppBar == false)
            ? CustomAppBar(
                title: GestureDetector(
                  child: Text(title),
                  onTap: () {
                    if (onTapTitle != null) {
                      onTapTitle!();
                    }
                  },
                ),
                menu: menu,
                backbutton: backbutton,
                settings: settings ?? true,
                topBarActions: topBarActions,
                topBarLeadingActions: topBarLeadingActions,
                centerAlign: centerAlignAppBar,
                leadingWidth: appBarleadingWidth ?? null,
                backGroundColor: backGroundColor,
              )
            : PreferredSize(
                preferredSize: const Size(0.0, 0.0),
                child: Container(),
              )),
      //  drawer: ((Responsive().deviceType() != "desktop") ? NavigationMenu() : null),
      //  endDrawer: showSettingsMenu == true ? SettingsMenu() : null,
        // body: body,
        body: Consumer<ThemeProvider>(builder: (context, notifier, child) {
          int _getBGSkin = notifier.buildBGSkin(context);

          var gradient;
          if (bgSkins.isNotEmpty) {
            if (bgSkins[_getBGSkin]!.containsKey("gradient")) {
              if (bgSkins[_getBGSkin]!["gradient"] == "linear") {
                gradient = sBGLinearGradient(context, bgSkins[_getBGSkin]!["colors"]);
              } else if (bgSkins[_getBGSkin]!["gradient"] == "radial") {
                gradient = sBGRadialGradient(context, bgSkins[_getBGSkin]!["colors"]);
              }
            }
          }

          var image;
          if (bgSkins.isNotEmpty) {
            if (bgSkins[_getBGSkin]!.containsKey("image")) {
              ImageRepeat repeat = ImageRepeat.noRepeat;
              BoxFit fit = BoxFit.cover;
              if (bgSkins[_getBGSkin]!.containsKey("repeat")) {
                repeat = bgSkins[_getBGSkin]!["repeat"];
              }
              if (bgSkins[_getBGSkin]!.containsKey("fit")) {
                fit = bgSkins[_getBGSkin]!["fit"];
              }

              image = const DecorationImage(
                repeat: ImageRepeat.noRepeat,
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              );
            }
          }

          // Widget bodyWidget = body;
          // if(appBackground != ""){
          Widget bodyWidget = AppBackground(body: body);
          // }

          return Container(
            decoration: BoxDecoration(
              image: image,
              gradient: gradient,
            ),
            child: bodyWidget,
          );
        }),
        floatingActionButton: (showFAB != null && showFAB! && onPressFAB != null)
            ? FloatingActionButton(
                onPressed: () {
                  onPressFAB!();
                },
                child: Icon(iconFAB),
                backgroundColor: colorFAB != null ? colorFAB : Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(borderRadius: sFABBorderRadius),
              )
            : null,
      );

      widget = scaffold;

      if (confirmAppExit == true) {
        widget = WillPopScope(
          onWillPop: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(T("ConfirmExit")),
                    content: Text(T("SureYouWantToExit")),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(T("Yes")),
                        onPressed: () {
                          // Navigator.pop(context);
                          SystemNavigator.pop();
                        },
                      ),
                      ElevatedButton(
                        child: Text(T("No")),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
            return Future.value(true);
          },
          child: scaffold,
        );
      }

      if (hasTabs == true) {
        widget = DefaultTabController(
          length: tabsLength,
          child: scaffold,
        );
      }
    }

    return SafeArea(
      child: Directionality(
        textDirection: languageDirection,
        child: widget,
      ),
    );
  }
}

class AppContentView extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final String? title;
  final bool showMenu;

  AppContentView({required this.mobile, this.desktop, this.tablet, this.title, this.showMenu = true});

  @override
  Widget build(BuildContext context) {
    // Desktop View
    if (Responsive().deviceType() == "desktop" && showMenu == true) {
      return Row(
        children: [
          SizedBox(height: 100,width: 100,),
          Expanded(
            child: desktop ?? mobile,
          ),
        ],
      );
    } else if (Responsive().deviceType() == "desktop" && showMenu == false)
      return desktop ?? mobile;

    // Tablet View
    else if (Responsive().deviceType() == "tablet")
      return tablet ?? mobile;

    // Default Mobile View
    else
      return mobile;
  }
}

class MobileView extends StatelessWidget {
  final Widget widget;

  MobileView({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: widget,
    );
  }
}

class TabletView extends StatelessWidget {
  final Widget widget;

  TabletView({required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: widget,
    );
  }
}

class DesktopView extends StatelessWidget {
  final String title;
  final Widget widget;
  final String menu;
  final String backbutton;
  final bool showAppBar;
  final bool? invisibleAppBar;
  final Color? backGroundColor;

  DesktopView({
    required this.widget,
    this.title = "",
    this.menu = "hide",
    this.backbutton = "",
    this.showAppBar = true,
    this.invisibleAppBar = false,
    this.backGroundColor,
  });


  @override
  Widget build(BuildContext context) {
    if (showAppBar == false || invisibleAppBar == true)
      return Container(
        alignment: Alignment.topCenter,
        child: widget,
      );
    // return Center(
    //   child: widget,
    // );
    else
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: Text(title),
            menu: menu,
            backbutton: backbutton,
            viewOn: "desktop",
            backGroundColor: backGroundColor,
          ),
          Expanded(
            child: widget,
          )
        ],
      );
  }
}
