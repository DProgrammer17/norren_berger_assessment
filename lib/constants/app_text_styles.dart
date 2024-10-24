import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:norrenberger_assesment/constants/app_colors.dart';
import 'package:norrenberger_assesment/constants/app_constants.dart';

abstract class AppTextStyles {
  static TextStyle h1 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w700,
    color: AppColors.textBlack,
    fontSize: 25.asp,
  );

  static TextStyle h2 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
    fontSize: 14.asp,
  );

  static TextStyle h3 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 16.asp,
  );

  static TextStyle h4 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 20.asp,
  );

  static TextStyle h5 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    color: AppColors.textBlack,
    fontSize: 18.asp,
  );

  static TextStyle body1Regular = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: 12.asp,
  );

  static TextStyle body2Regular = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: 14.asp,
  );

  static TextStyle body3Regular = GoogleFonts.montserrat(
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: 10.asp,
  );

  static TextStyle bodyRegularSize14 = GoogleFonts.montserrat(
    fontSize: 14.asp,
    fontWeight: FontWeight.w500,
    color: AppColors.textBlack,
  );

}