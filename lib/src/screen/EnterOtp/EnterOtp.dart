import 'package:flutter/material.dart';
import 'package:sample_base_framework/src/Services/AppLayout/app_layout.dart';
import '../../Services/Languages/Languages.dart';

import '../../Constants/style.dart';


class EnterOtp extends StatefulWidget {
  static const routeName = 'enter-otp';

  @override
  _EnterOtpState createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();
  final FocusNode _focus4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AppScaffold(
        showAppBar: false,
        body: AppContentView(
          showMenu: false,
          mobile: MobileView(
            widget: _buildContent(context),
          ),
          desktop: DesktopView(
            showAppBar: false,
            widget: _buildContent(context),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Text(
              T("EnterOTP"),
              style: sHeading3White(context),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CustomShiftFocusTextField(focusNode: _focus1, isFirst: true, isLast: false),
              // CustomShiftFocusTextField(focusNode: _focus2, isFirst: false, isLast: false),
              // CustomShiftFocusTextField(focusNode: _focus3, isFirst: false, isLast: false),
              // CustomShiftFocusTextField(focusNode: _focus4, isFirst: false, isLast: true),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          // CustomButton(
          //   height: sBlockButtonHeight,
          //   child: Text(
          //     T("SignIn"),
          //     style: theme.textTheme.button,
          //   ),
          //   onPressed: () {
          //     // Navigator.pop(context);
          //     Navigator.of(context).pushNamed('dashboard');
          //     ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context, T("WelcometoApp"), iconWelcomeToApp));
          //   },
          // ),
          SizedBox(
            height: 25,
          ),
          // TextLink(
          //   text: T("ResendOTP"),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.of(context).pushNamed('enter-otp');
          //     ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context, "OTPSent", iconOTPSent, false));
          //   },
          //   style: sBodyText1White(context),
          // ),
          SizedBox(
            height: 15,
          ),
          // AccessFormBottomLinks(
          //   widgetType: "row",
          //   link1: "sign-in",
          //   text1: T("SignIn"),
          //   link2: "sign-up",
          //   text2: T("SignUp"),
          // ),
        ],
      );
    //);
  }
}
