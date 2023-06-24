// import 'package:flutter/material.dart';
//
// abstract class AppTheme {
//   static ThemeData get light {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         color: Colors.white,
//       ),
//       scaffoldBackgroundColor: Colors.white,
//       primaryColor: Colors.black,
//       splashColor: Colors.transparent,
//       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
//     );
//   }
//
//   static ThemeData get dark {
//     return ThemeData(
//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         color: Colors.black,
//       ),
//       scaffoldBackgroundColor: Colors.black,
//       primaryColor: Colors.white,
//       splashColor: Colors.transparent,
//       colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
//     );
//   }
//
//   static bool isDark(BuildContext context) {
//     return Theme.of(context).brightness == Brightness.dark;
//   }
//
//   static bool isLight(BuildContext context) {
//     return Theme.of(context).brightness == Brightness.light;
//   }
// }

import 'package:e_commerce_app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ThemeData darkTheme = ThemeData(

    unselectedWidgetColor:Colors.white,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18, color: kTextDarkColor, fontWeight: FontWeight.w600),
        caption: TextStyle(
          fontSize: 15,
          color: kTextDarkColor,

        )

    ),
    // primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: kDarkBackGroundColor,
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: kTextDarkColor, size: 26),
        color: kDarkBackGroundColor,
        elevation: 0.0,
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(

          color: kTextDarkColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            //statusBarColor:kDarkBackGroundColor,
            // statusBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      backgroundColor: kBackGroundColor,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      elevation: 10,
    ));
ThemeData lightTheme = ThemeData(
  // primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color:  kDarkBackGroundColor,
        ),
        actionsIconTheme: IconThemeData(color: kDarkBackGroundColor, size: 26),
        color: kBackGroundColor,
        elevation: 0.0,
        backwardsCompatibility: false,
        titleTextStyle: TextStyle(

          color: kTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  kPrimaryColor,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      elevation: 10,
    ));