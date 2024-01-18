import 'package:flutter/material.dart';

import '../config/Config.dart';

class Themes {
  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    backgroundColor: AppColors.Dbg,
    cardColor: AppColors.DcontainerColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: AppColors.DfontColor,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.DIconColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.DBarColor,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500),
  );
  static ThemeData customLightTheme = ThemeData.light().copyWith(
    backgroundColor: AppColors.bg,
    cardColor: AppColors.containerColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: AppColors.secoundfontColor,
      ),
      bodyText2: TextStyle(
        color: AppColors.smalltextfontColor,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.Icon1Color,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.BBarColor,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey.shade500),
  );
}
