import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTypography {
  static const fontFamily = 'Metropolis';

  static const headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const headline3 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  static const headline4 = TextStyle(
      fontSize: 18, color: AppColors.green, fontWeight: FontWeight.w700);
  static const headline5 = TextStyle(
      fontSize: 22, color: AppColors.black, fontWeight: FontWeight.w700);

  static const bodyText1 = TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontWeight: FontWeight.w600,
  );

  static const bodyText2 =
      TextStyle(fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary, height: 28);


  static const bodyText3 = TextStyle(
    fontSize: 16,
    color: AppColors.text,
    fontWeight: FontWeight.w600,
  );
  static const bodyText4 = TextStyle(
    fontSize: 14,
    height: 1.6,
    color: AppColors.textSecondary2,
    fontWeight: FontWeight.w500,
  );
  static const bodyText55 = TextStyle(
    fontSize: 14,
    height: 1.6,
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );  static const bodyText5 = TextStyle(
    fontSize: 14,
    height: 1.6,
    color: AppColors.text,
    fontWeight: FontWeight.w500,
  );
  static const caption = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600,
    // height: 12,
    color: AppColors.white,
  );

  static const caption1 = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400,
    // height: 12,
    color: AppColors.white,
  );
  static const caption2 = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400,
    // height: 12,
    color: AppColors.black,
  );
  static const caption3 = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500,
    // height: 12,
    color: AppColors.text,
  );
}
