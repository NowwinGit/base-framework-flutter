import 'package:flutter/material.dart';
import '../Constants/customIcons.dart';

/*------------------ General App Typography ------------------*/

TextStyle sHeading2White(BuildContext context) => Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading4White(BuildContext context) => Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading5White(BuildContext context) => Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sHeading3White(BuildContext context) => Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sHeading6White(BuildContext context) => Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sBodyText1White(BuildContext context) => Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white.withOpacity(0.9));

TextStyle sBodyText2White(BuildContext context) => Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white.withOpacity(0.9));
TextStyle sBodyText2Black(BuildContext context) => Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.black.withOpacity(0.9));

TextStyle sTextLink(BuildContext context) => Theme.of(context).textTheme.bodyText1!;

TextStyle sText(BuildContext context) => Theme.of(context).textTheme.bodyText1!;
TextStyle sText2(BuildContext context) => Theme.of(context).textTheme.bodyText2!;
TextStyle sHeading2(BuildContext context) => Theme.of(context).textTheme.headline2!;
TextStyle sHeading3(BuildContext context) => Theme.of(context).textTheme.headline3!;
TextStyle sHeading4(BuildContext context) => Theme.of(context).textTheme.headline4!;
TextStyle sHeading5(BuildContext context) => Theme.of(context).textTheme.headline5!;
TextStyle sHeading6(BuildContext context) => Theme.of(context).textTheme.headline6!;

Color sTextOnPrimaryColor(BuildContext context) {
  Color color;
  if (Theme.of(context).primaryColorBrightness == Brightness.light) {
    color = Colors.blueGrey[800]!;
  } else {
    color = Colors.white;
  }
  return color;
}

Color sTextOnBrightness(BuildContext context, Brightness brightness) {
  Color color;
  if (brightness == Brightness.light) {
    color = Colors.blueGrey[800]!;
  } else {
    color = Colors.white;
  }
  return color;
}

TextStyle sTitleOverImage(BuildContext context) => Theme.of(context).textTheme.headline6!.copyWith(
      color: Colors.white.withOpacity(0.9),
      backgroundColor: Colors.blueGrey[800]!.withOpacity(0.7),
    );

Color sDarkColor = Colors.blueGrey[800]!;

/*------------------ Navigation Menu Styles ------------------*/

// Navigation Menu Header colors
TextStyle sNavMenuTitle(BuildContext context) => sHeading6White(context);

TextStyle sNavMenuSubTitle(BuildContext context) => sBodyText1White(context);

TextStyle sNavMenuEdit(BuildContext context) => sBodyText2White(context);

double sNavMenuBgRadius = 10;

bool sNavMenuCloseButton = true;
bool sSettingsMenuCloseButton = true;

// Navigation Menu Item Text Color

Color sNavMenuItemColor(BuildContext context) {
  Color color;
  Color canvasColor = Theme.of(context).canvasColor;

  if (canvasColor == Theme.of(context).primaryColor) {
    if (Theme.of(context).primaryColorBrightness == Brightness.light) {
      color = Colors.blueGrey[800]!;
    } else {
      color = Colors.grey[200]!;
    }
  } else if (canvasColor == sMenuLight) {
    color = Colors.blueGrey[800]!;
  } else {
    color = Colors.blueGrey[100]!;
  }
  return color;
}

TextStyle sNavMenuItem(BuildContext context) {
  return Theme.of(context).textTheme.bodyText1!.copyWith(
        color: sNavMenuItemColor(context),
        fontWeight: FontWeight.w600,
      );
}

Color sNavMenuArrow(BuildContext context) {
  Color color = sNavMenuItemColor(context);

  return color.withOpacity(0.7);
}

// Navigation Menu Item Icon Color
Color sNavMenuItemIconColor(BuildContext context) {
  return Theme.of(context).primaryColor;

  // Color color;
  // Color canvasColor = Theme.of(context).canvasColor;

  // if (canvasColor == Theme.of(context).primaryColor) {
  //   if (Theme.of(context).primaryColorBrightness == Brightness.light) {
  //     color = Colors.blueGrey[800]!;
  //   } else {
  //     color = Colors.grey[200]!;
  //   }
  // } else if (Theme.of(context).primaryColorBrightness == Brightness.light) {
  //   color = Colors.blueGrey[800]!;
  // } else {
  //   color = Colors.white;
  // }
  // return color;
}

// Navigation Menu Item Icon Decoration
BoxDecoration sNavMenuItemIconDecoration(BuildContext context) {
  // Color primaryColor = Theme.of(context).primaryColor;
  // Color canvasColor = Theme.of(context).canvasColor;

  return BoxDecoration(
    // color: Colors.black.withOpacity(0.25), //(canvasColor == primaryColor) ? Colors.black.withOpacity(0.25) : primaryColor,
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

// Navigation Menu Section Heading
TextStyle sNavMenuSectionName(BuildContext context) {
  Color color;
  Color canvasColor = Theme.of(context).canvasColor;

  if (canvasColor == Theme.of(context).primaryColor) {
    if (Theme.of(context).primaryColorBrightness == Brightness.light) {
      color = Colors.blueGrey[800]!;
    } else {
      color = Colors.grey[200]!;
    }
  } else if (canvasColor == sMenuLight) {
    color = Colors.blueGrey[500]!;
  } else {
    color = Colors.blueGrey[200]!;
  }

  return Theme.of(context).textTheme.bodyText2!.copyWith(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
      );
}

// const double sNavMenuItemIconSize = 24;

double sNavMenuItemIconSize(BuildContext context, [IconData? icon, double? size]) {
  if (size != null) {
    return size;
  }
  // else if(icon == iconDashboard){ return 22; }
  return 24;
}

Color sNavMenuItemHoverColor(BuildContext context) => Colors.black.withOpacity(.15);
Color sSettingsMenuCardColor(BuildContext context, String type) {
  Color txtcolor;
  Color bgcolor;

  Color canvasColor = Theme.of(context).canvasColor;

  if (canvasColor == Theme.of(context).primaryColor) {
    if (Theme.of(context).brightness != Brightness.light) {
      txtcolor = Colors.blueGrey[100]!;
      bgcolor = Colors.blueGrey[700]!;
    } else {
      txtcolor = Colors.grey[700]!;
      bgcolor = Colors.grey[100]!;
    }
  } else if (canvasColor == sMenuLight) {
    txtcolor = Colors.blueGrey[700]!;
    bgcolor = Colors.grey[100]!;
  } else {
    txtcolor = Colors.blueGrey[100]!;
    bgcolor = Colors.blueGrey[700]!;
  }
  if (type == "bg") {
    return bgcolor;
  } else {
    return txtcolor;
  }
}

TextStyle sSettingsMenuCardText(BuildContext context, [Color? color]) {
  return Theme.of(context).textTheme.bodyText2!.copyWith(
        color: ((color != null) ? color : sSettingsMenuCardColor(context, "text")),
        // color: ((color != null) ? color : ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800] : Colors.blueGrey[200])),
      );
}

TextStyle sSettingsMenuCardSmallText(BuildContext context, [Color? color]) => Theme.of(context).textTheme.caption!.copyWith(
      color: ((color != null) ? color : sSettingsMenuCardColor(context, "text")),
      // color: ((color != null) ? color : ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800] : Colors.blueGrey[200])),
    );

/*------------------ Menu Color ------------------*/

Color sMenuLight = Colors.white;
Color sMenuLightText = Colors.blueGrey[700]!;

Color sMenuDark = Colors.blueGrey[800]!;
Color sMenuDarkText = Colors.blueGrey[100]!;

/*------------------ Avatar and List Text Styles ------------------*/

TextStyle sListAvatarText(BuildContext context, [double size = 18.0]) {
  return Theme.of(context).textTheme.headline6!.copyWith(color: sTextOnPrimaryColor(context), fontSize: size, height: 1);
}

const double sNotificationAvatarSize = 36.0;
const double sNotificationIconSize = 20.0;

const double sAvatarSize = 44.0;
double sAvatarBorderRadius(BuildContext context, double size) => (6);
BoxShadow sAvatarShadow = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  blurRadius: 4,
  offset: Offset(1, 1),
);

EdgeInsets sUserGridButtonsPadding = EdgeInsets.fromLTRB(6, 0, 6, 0);
EdgeInsets sUserGridPadding = EdgeInsets.fromLTRB(10, 20, 10, 15);

/*------------------Form Fields Style------------------*/
const double sTextFieldElevation = 4;
Color sTextFieldShadow = Colors.black.withOpacity(0.5);
BorderRadius sTextFieldBorderRadius = BorderRadius.circular(6.0);

TextStyle sTextFieldText(BuildContext context) => Theme.of(context).textTheme.bodyText1!.copyWith(
      color: ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800] : Colors.white),
    );

Color sDateFieldLabelColor(BuildContext context) =>
    ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800]! : Colors.white.withOpacity(0.8));

Color sTextFieldLabelFocusedBackground(BuildContext context) =>
    ((Theme.of(context).brightness == Brightness.light) ? Colors.white.withOpacity(0.8) : Colors.blueGrey[800]!.withOpacity(0.8));

const double sTextFieldLabelfontSize = 16;
const double sTextFieldSmallLabelfontSize = 12;
bool sTextFieldFilled = true;

Color sTextFieldFillColor(BuildContext context) =>
    ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[50]!.withOpacity(1) : Colors.blueGrey[900]!.withOpacity(0.8));

Color sTextFieldLabelColor(BuildContext context) =>
    ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[800]!.withOpacity(0.8) : Colors.white.withOpacity(0.8));

EdgeInsetsDirectional sTextFieldPadding = EdgeInsetsDirectional.only(start: 25.0, bottom: 5.0, top: 4.0, end: 25.0);

BorderSide sTextFieldBorderSide(BuildContext context) =>
    ((Theme.of(context).brightness == Brightness.light) ? BorderSide(color: Colors.white) : BorderSide(color: Colors.blueGrey));

BorderSide sTextFieldFocusBorderSide(BuildContext context) => sTextFieldBorderSide(context);
BorderSide sTextFieldEnableBorderSide(BuildContext context) => sTextFieldBorderSide(context);
BorderSide sTextFieldErrorBorderSide(BuildContext context) => BorderSide(color: Colors.redAccent);
BorderSide sTextFieldFocusErrorBorderSide(BuildContext context) => sTextFieldBorderSide(context);

String sTextFieldLabelPrefix = " ";
String sTextFieldLabelSuffix = " ";

TextStyle sTextFieldErrorText(BuildContext context) => Theme.of(context).textTheme.bodyText2!.copyWith(
      color: Colors.white,
    );

/*------------------Button Style------------------*/
ButtonStyle sSmallGrayButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[400]!),
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(10.0, 0, 10.0, 0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    )));

ButtonStyle sPrimaryButton = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(14.0, 0, 14.0, 0)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0),
    )));

ButtonStyle sSmallWhiteButton = sSmallGrayButton.copyWith(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey[100]!),
);

ButtonStyle sXSmallGrayButton = sSmallGrayButton.copyWith(
  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.fromLTRB(3.0, 0, 3.0, 0)),
);

ButtonStyle sSmallPrimaryButton = sPrimaryButton.copyWith(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4.0),
)));

TextStyle sSmallButtonText(BuildContext context) => Theme.of(context).textTheme.button!.copyWith(fontSize: 14.0);
TextStyle sSmallWhiteButtonText(BuildContext context) => Theme.of(context).textTheme.button!.copyWith(
      fontSize: 14.0,
      color: Colors.blueGrey[800],
    );
TextStyle sButtonText(BuildContext context) => Theme.of(context).textTheme.button!.copyWith(fontSize: 16.0);

// Color sSmall
Color sSmallGrayButtonText = Colors.white;

const double sButtonHeight = 40;
const double sSmallButtonHeight = 30;
const double sXSmallButtonHeight = 20;
const double sBlockButtonHeight = 50;

ButtonStyle sSmallButton = sSmallGrayButton;

ButtonStyle sXSmallButton = sXSmallGrayButton;

EdgeInsets sButtonPadding = EdgeInsets.symmetric(horizontal: 5);

EdgeInsets sActivityItemInnerPadding = EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10);
EdgeInsets sAvatarListItemInnerPadding(BuildContext context, String deviceType) =>
    ((deviceType == "mobile") ? EdgeInsets.fromLTRB(0, 5, 0, 5) : EdgeInsets.fromLTRB(0, 10, 0, 10));

EdgeInsets sActivityContentPadding = EdgeInsets.fromLTRB(sGutterGap, 0.0, sGutterGap, 0.0);

EdgeInsets sAppointmentContentPadding = EdgeInsets.fromLTRB(80, 0.0, sGutterGap, 0.0);


bool activityTextAboveMedia = false;
/*------------------Action Style------------------*/

Color sActionIconColor(BuildContext context) => ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[600]! : Colors.blueGrey[200]!);

/*------------------Card, Container, Box Style------------------*/

Color sDivider(BuildContext context) => ((Theme.of(context).brightness == Brightness.light) ? Colors.blueGrey[50]! : Colors.blueGrey[700]!);

const double sCardElevation = 3;
Radius sCardRadius = Radius.circular(6.0);
BorderRadius sCardBorderRadius = BorderRadius.circular(6.0);
BorderRadius sImageBorderRadius = BorderRadius.circular(4.0);
EdgeInsets sHorizontalGap = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
EdgeInsets sVerticalGap = EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0);
EdgeInsets sPagePaddingDesktop = EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0);
EdgeInsets sAllSidesGap = EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0);
BorderRadius sFABBorderRadius = BorderRadius.circular(4.0);

const double sGutterGap = 20.0;

BorderRadius sCardSmallBorderRadius = BorderRadius.circular(4.0);

/*------------------Gallery and Grid------------------*/

const double sGridItemSpacing = 10.0;
int responsiveColumns(BuildContext context, String deviceType, double deviceWidth, [String? type]) {
  if (deviceType == "desktop") {
    return 4;
  } else if (deviceType == "tablet") {
    return 3;
  } else {
    return 2;
  }
}

/*------------------Badge------------------*/

const double sBadgeRadius = 2.0;
const double sBadgeSize = 20.0;
const double sBadgeTextHeight = 16.0;
const double sBadgeTextWidth = 60.0;

TextStyle sListBadgeText(BuildContext context) => Theme.of(context).textTheme.caption!.copyWith(color: sTextOnPrimaryColor(context), height: 0.8);

/*------------------ Chat ------------------*/

BorderRadius sChatLeftBoxRadius = BorderRadius.only(
  topRight: sCardRadius,
  topLeft: sCardRadius,
  bottomRight: sCardRadius,
);

BorderRadius sChatRightBoxRadius = BorderRadius.only(
  topRight: sCardRadius,
  topLeft: sCardRadius,
  bottomLeft: sCardRadius,
);

EdgeInsets sChatLeftMargin = EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0);
EdgeInsets sChatRightMargin = EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0);

EdgeInsets sChatMessageGap = EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 15.0);

BoxConstraints sChatMessage = BoxConstraints(maxWidth: 600);

double sChatAvatarSize = 30;

/*------------------ Snackbar ------------------*/

Color sSnackbarColor(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.8); // Colors.blueGrey[600]!;
const double sSnackBarMaxWidth = 400;
const double sSnackbarHeight = 50.0;
const double sSnackbarBorderRadius = 4.0;
BoxShadow sSnackbarShadow = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  blurRadius: 4,
  offset: Offset(1, 1),
);
Color sSnackBarIcon = Colors.white;

TextStyle sSnackbarText(BuildContext context) => Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.white.withOpacity(0.95),
    );

EdgeInsets sSnackbarIconPadding = EdgeInsets.only(top: 2);

/*------------------ Overlay ------------------*/

Color sSignInOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sSignUpOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sForgotPasswordOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sEnterPhoneOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sResetPasswordOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sEnterOtpOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);
Color sPaymentSuccessOverlay(BuildContext context) => Theme.of(context).primaryColor.withOpacity(0.2);

/*------------------ TopBar Color ------------------*/

Color sTopBarLight = Colors.white;
Color sTopBarLightText = Colors.blueGrey[700]!;

Color sTopBarDark = Colors.blueGrey[700]!;
Color sTopBarDarkText = Colors.blueGrey[100]!;

/*------------------ Page Section ------------------*/

Color sPageSectionBG(BuildContext context) => ((Theme.of(context).brightness == Brightness.light) ? Colors.white : Colors.blueGrey[800]!);

/*------------------ Tab Bar ------------------*/

Color sTabBarIndicator(BuildContext context) {
  return (Theme.of(context).appBarTheme.backgroundColor == Theme.of(context).primaryColor)
      ? sTextOnPrimaryColor(context)
      : Theme.of(context).primaryColor;
}

const double sTabBarIndicatorWeight = 2;

EdgeInsets tabBarPadding(context, device) => device != "desktop" ? const EdgeInsets.only(left: sGutterGap, right: sGutterGap) : EdgeInsets.zero;

/*------------------ Rating ------------------*/

double sRatingStarSize = 20;
TextStyle sRatingValue(BuildContext context, [double? fontSize]) {
  return Theme.of(context).textTheme.headline4!.copyWith(height: 1, fontSize: fontSize ?? 38, color: Theme.of(context).primaryColor);
}


Color sRatingStarColor(BuildContext context, String type) {
  if (type == 'outline') {
    return Colors.grey;
  }
  // else if(type == "filled" || type == "half"){
  //   return Colors.amber[700]!;
  // }
  return Theme.of(context).primaryColor;
}

/*------------------ Gradient ------------------*/

LinearGradient sBGLinearGradient(BuildContext context, List<Color> colors) {
  return LinearGradient(
    colors: colors,
    begin: const FractionalOffset(0.0, 1.0),
    end: const FractionalOffset(0.0, 0.0),
    stops: [0.0, 1.0],
    // tileMode: TileMode.clamp,
  );
}

RadialGradient sBGRadialGradient(BuildContext context, List<Color> colors) {
  return RadialGradient(
    center: Alignment(0.0, 0.0), // near the top right
    radius: 0.7,
    colors: colors,
    stops: [0.1, 0.9],
    // tileMode: TileMode.clamp,
  );
}

/*------------------ Responsive ------------------*/
// BoxConstraints sLandScapeContainer = BoxConstraints(maxWidth: 1200);
// BoxConstraints sPortraitContainer = BoxConstraints(maxWidth: 400);
BoxConstraints sLandScapeForm = BoxConstraints(maxWidth: 600);

/*------------------App Images------------------*/
const String imageNotFound = "assets/images/image-not-found.png";

const String imageSignInPortrait = "assets/images/access-3.jpg";
const String imageSignInLandScape = "assets/images/access-3-ls.jpg";

const String imageSignUpPortrait = "assets/images/access-4.jpg";
const String imageSignUpLandScape = "assets/images/access-4-ls.jpg";

const String imageForgotPasswordPortrait = "assets/images/access-5.jpg";
const String imageForgotPasswordLandScape = "assets/images/access-5-ls.jpg";

const String imageEnterPhonePortrait = "assets/images/access-6.jpg";
const String imageEnterPhoneLandScape = "assets/images/access-6-ls.jpg";

const String imageResetPasswordPortrait = "assets/images/access-7.jpg";
const String imageResetPasswordLandScape = "assets/images/access-7-ls.jpg";

const String imageEnterOtpPortrait = "assets/images/access-11.jpg";
const String imageEnterOtpLandScape = "assets/images/access-11-ls.jpg";

const String imagePaymentSuccessPortrait = "assets/images/access-7.jpg";
const String imagePaymentSuccessLandScape = "assets/images/access-7-ls.jpg";


/*------------------App icons------------------*/

const IconData iconLike = Icons.thumb_up_outlined;
const IconData iconShare = Icons.share_outlined;
const IconData iconMessage = Icons.message_outlined;
const IconData iconQuestion = Icons.help_outline;
const IconData iconMore = Icons.more_horiz_sharp;
const IconData iconMenu = Icons.menu;
const IconData iconSettings = Icons.settings_outlined;
const IconData iconOTPSent = Icons.phone_android_outlined;
const IconData iconWelcomeToApp = Icons.emoji_emotions_outlined;
const IconData iconPasswordSaved = Icons.lock_outline;
const IconData iconDashboard = Icons.medical_services_outlined;
const IconData iconActivities = Icons.local_activity_outlined;
const IconData iconProfile = Icons.account_circle_outlined;
const IconData iconUsers = Icons.people_outlined;
const IconData iconMessages = Icons.chat_bubble_outline;
const IconData iconFriends = Icons.person_add_outlined;
const IconData iconUserGroups = Icons.groups_outlined;
const IconData iconGallery = Icons.collections_outlined;
const IconData iconFollowers = Icons.person_pin_outlined;
const IconData iconFaqs = Icons.help_outline_outlined;
const IconData iconEditProfile = Icons.manage_accounts_outlined;
const IconData iconWelcome = Icons.home_outlined;
const IconData iconSignIn = Icons.login_outlined;
const IconData iconSignUp = Icons.how_to_reg_outlined;
const IconData iconEnterMobile = Icons.phone_iphone_outlined;
const IconData iconEnterOTP = Icons.dialpad_outlined;
const IconData iconForgotPassword = Icons.lock_open_outlined;
const IconData iconResetPassword = Icons.password_outlined;
const IconData iconTermsConditions = Icons.policy_outlined;
const IconData iconPrivacyPolicy = Icons.verified_user_outlined;
const IconData iconSignOut = Icons.logout_outlined;
const IconData iconSettingsSelect = Icons.check_box_outlined;
const IconData iconImage = Icons.image_outlined;
const IconData iconAdd = Icons.add;
const IconData iconDoctors = CustomIcons.user_md;
const IconData iconPatients = Icons.people_outlined;
const IconData iconStarFilled = Icons.star;
const IconData iconStarHalf = Icons.star_half;
const IconData iconStarOutline = Icons.star_outline;
const IconData iconSpecialties = Icons.medication_outlined;
const IconData iconSearch = Icons.manage_search;
const IconData iconPaymentSuccess = Icons.thumb_up_outlined;
const IconData iconAppointments = Icons.calendar_today_outlined;
const IconData iconReviews = Icons.reviews_outlined;
const IconData iconNotifications = Icons.notifications_active_outlined;

        //                 Icon(CustomIcons.doctor, size: 100,), // physician
        //                 Icon(CustomIcons.dentist, size: 100,),
        //                 Icon(CustomIcons.heart, size: 100,),
        //                 Icon(CustomIcons.physiotherapist, size: 100,),
        //                 Icon(CustomIcons.neurology, size: 100,),
        //                 Icon(CustomIcons.ophthalmologist, size: 100,),
        //                 Icon(CustomIcons.pediatrician, size: 100,),
        //                 Icon(CustomIcons.ultrasound, size: 100,), //obstetrician

// const sActiveColor = Color(0xFF455A64);
