// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Languages extends StatelessWidget {

  static Map<String, String> langNames = {
    'en': 'English',
    'af': 'Afrikaans',
    'ar': 'Arabic',
    'de': 'German',
    'es': 'Spanish',
    'fr': 'French',
    'hi': 'Hindi',
    'it': 'Italian',
    'ja': 'Japanese',
    'pt': 'Portugese',
    'ru': 'Russian',
    'zh': 'Chinese',
  };

  static List<Locale> supportedLocales = [
    Locale('en'),
    Locale('af'),
    Locale('ar'),
    Locale('de'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh'),
  ];
  // static Map<String,String> langNames = {
  //     'en_EN': 'English',
  //     'vi_VN': 'Vietnamese',
  //     'fr_FR': 'French',
  //     'hi_HI': 'Hindi',
  //     'ar_AE': 'Arabic',
  // };

  // static List<Locale> supportedLocales = [
  //       Locale('en', 'EN'),
  //       Locale('vi', 'VN'),
  //       Locale('fr', 'FR'),
  //       Locale('hi', 'HI'),
  //       Locale('ar', 'AE'),
  //     ];


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

String T(String s, [String? type, Map<String, String>? namedArgs, List<String>? args]) {

  if(s.trim() == ""){
    return s;
  }

  if (type == "number") {
    s.split('');

    List nos = s.codeUnits.map((unit) {
      return String.fromCharCode(unit);
    }).toList();

    String result = "";
    nos.forEach((n) {
      if(n.toString() == " " || n.toString() == "+"){
        result += n.toString(); 
      } else {
        result += T("number."+n.toString()+"");
      }
    });
    // print(nos);
    return result;
    //return s;
  }


  return s.tr(namedArgs: namedArgs, args: args).toString();
}