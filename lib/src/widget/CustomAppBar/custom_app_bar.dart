import 'package:flutter/material.dart';
import '../../Constants/constants.dart';
import '../../Constants/style.dart';
import '../../Services/Responsive/Responsive.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final String menu;
  final String backbutton;
  final bool settings;
  final String? viewOn;
  final List<Widget>? topBarActions;
  final List<Widget>? topBarLeadingActions;
  final bool? centerAlign;
  final double? leadingWidth;
  final Color? backGroundColor;

  CustomAppBar({
    Key? key,
    required this.title,
    required this.menu,
    required this.backbutton,
    this.centerAlign = false,
    this.settings = true,
    this.viewOn = "",
    this.leadingWidth,
    this.topBarActions,
    this.topBarLeadingActions, this.backGroundColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> leading = [];

    if ((widget.menu == "show") && Responsive().deviceType() != "desktop") {
      leading.add(SizedBox(
        height: 40,
        width: 50,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 10),
          child: IconButton(
            icon: Icon(iconMenu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ));
    }

    if ((widget.backbutton == "show")) {
      leading.add(SizedBox(
        height: 40,
        width: 40,
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 10),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ));
    }

    List<Widget> actions = [];
    if (widget.settings == true) {
      // if (pageHeaderIcons.contains("avatar")) {
      //   actions.add(
      //     Container(
      //       height: 32,
      //       width: 32,
      //       child: CurrentUserAvatar(
      //         onTapAction: "profile",
      //         onTap: () {},
      //       ),
      //     ),
      //   );
      //
      //   actions.add(
      //     SizedBox(
      //        width: ((widget.viewOn == "desktop") ? 15 : 2),
      //     ),
      //   );
      // }

      if (pageHeaderIcons.contains("settings")) {
        actions.add(
          Padding(
            padding: const EdgeInsets.only(
              // right: ((widget.viewOn == "desktop") ? 15 : 2),
            ),
            child: IconButton(
              icon: Icon(iconSettings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        );
      }
    }

    if (widget.topBarActions != null) {
      if (widget.topBarActions!.isNotEmpty) {
        actions += widget.topBarActions!;
      }
    }

    if (widget.topBarLeadingActions != null) {
      if (widget.topBarLeadingActions!.isNotEmpty) {
        leading += widget.topBarLeadingActions!;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: AppBar(
        backgroundColor: widget.backGroundColor??Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leadingWidth: widget.leadingWidth ?? null,
        centerTitle: widget.centerAlign ?? false,
        titleSpacing: ((widget.viewOn == "desktop") ? 20 : 2),
        title: widget.title,
        leading: ((leading.length > 0)
            ? Container(
                child: Row(children: leading),
              )
            : null),
        actions: [
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.only(end: widget.viewOn == "desktop" ? 15.0 : 2.0 ),
              child: Row(children: actions),
            ),
          ),
        ],
      ),
    );
  }
}
