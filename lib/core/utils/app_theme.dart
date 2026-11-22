import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_color.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class AppTheme {
  
static final ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: AppColors.gold,
      // type: BottomNavigationBarType.fixed,

         selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.black,

          selectedLabelStyle: AppStyles.bold12White

  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.black,
    iconTheme: IconThemeData(
      color: AppColors.gold
    ),
  )

  //   textTheme: TextTheme(
  //     headlineLarge: AppStyles.bold16White),

  );

  
}
