import 'package:flutter/material.dart';
import '../../Services/Responsive/Responsive.dart';
import '../../Constants/constants.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key, required this.body}) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) {
    Widget bgWidget = Stack(
      children: [
        Positioned(
          top: 0,
          left: (Responsive().deviceType() != "desktop") ? 0 : (menuWidthDesktop),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: appBackgroundElevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(appBackgroundRadius),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(appBackgroundRadius),
                bottomRight: Radius.circular(appBackgroundRadius),
              ),
              child: Container(
                width: (Responsive().deviceType() != "desktop") ? deviceWidth : (deviceWidth! - menuWidthDesktop),
                height: appBackgroundHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor,
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.cover,
                    repeat: ImageRepeat.noRepeat,
                  ),
                ),

                // color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        body,
      ],
    );

    return bgWidget;
  }
}
