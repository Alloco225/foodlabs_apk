//************
// ** Environnment file
//** Contains app related environment variables */
// api routes, subscription, app urls
//
// Env
// Theme
// Utils // conversions // formatting

import 'package:flutter/material.dart';

// Application Env
// Also BackOffice link
class Env {
  static const String appName = "Emairie GrandBassam";
  //
  static const String baseUri = "https://emairie.adjemincloud.com/api/";
  // static const String baseUri = "http://localhost:8000/api/";
  // List the remaining api urls here

  static const Map<String, String> headers = {
    'Content-Type': "application/json",
    'Accept': "application/json",
  };
  
  // Localisation
  static const String appLocale = "fr_FR";
  // Number, Date Formating

  static const String appCurrencyCode = "XOF";
  static const String appCurrencySymbol = "Fcfa";

  // *** Map
  // Abidjan coordinates
  static const double latitude = 5.225936;
  static const double longitude = -3.753666;
}

// Application Theme
class AppTheme {
  static Color appPrimary = Color(0xffdd1d21);
  static Color appPrimary100 = Color(0xffeb777a);
  static Color appPrimary200 = Color(0xffe76164);
  static Color appPrimary300 = Color(0xffe44a4d);
  static Color appPrimary400 = Color(0xffe03437);
  static Color appPrimary500 = appPrimary;
  static Color appPrimary600 = Color(0xffc71a1e);
  static Color appPrimary700 = Color(0xffb1171a);
  static Color appPrimary800 = Color(0xff9b1417);
  static Color appPrimary900 = Color(0xff851114);
  //
  static Color appSecondary = Color(0xfffbce07);
  static Color appSecondary100 = Color(0xfffde26a);
  static Color appSecondary200 = Color(0xfffcdd51);
  static Color appSecondary300 = Color(0xfffcd839);
  static Color appSecondary400 = Color(0xfffbd320);
  static Color appSecondary500 = appSecondary;
  static Color appSecondary600 = Color(0xffe2b906);
  static Color appSecondary700 = Color(0xffc9a506);
  static Color appSecondary800 = Color(0xffb09005);
  static Color appSecondary900 = Color(0xff977c04);

  // Main app theme
  static ThemeData appTheme = ThemeData(
    // shell red : #dd1d21 &H211ddd
    // shell yellow : #fbce07 &H7cefb
    // primarySwatch: Colors.blue,
    primaryColor: appPrimary,
    accentColor: appSecondary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// *** Other constants and
// Number, Date Formating

// final $numberFormat = NumberFormat.currency(
//   locale: Env.appLocale,
//   symbol: Env.appCurrencySymbol,
//   decimalDigits: 0,
// );

// final Intl.defaultLocale = "zh_HK";

// final $dateFormat = DateFormat.yMMMd("fr_FR");
// final $dateFormat = DateFormat.yMMMEd("fr_FR");
