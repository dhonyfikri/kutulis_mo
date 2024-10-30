import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutulis_mo/app/resources/app_colors.dart';

class AppFonts {
  AppFonts._();

  // Primary
  static TextStyle primaryRegularTextStyle = GoogleFonts.dmSans(
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryLightTextStyle = GoogleFonts.dmSans(
    color: AppColors.primary.withOpacity(0.6),
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySemiBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.primary,
    fontWeight: FontWeight.w600,
  );

  static TextStyle primaryBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  // Black
  static TextStyle blackRegularTextStyle = GoogleFonts.dmSans(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle blackLightTextStyle = GoogleFonts.dmSans(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackSemiBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle blackBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
  );

  // Gray
  static TextStyle grayRegularTextStyle = GoogleFonts.dmSans(
    color: AppColors.gray,
    fontWeight: FontWeight.w500,
  );

  static TextStyle grayLightTextStyle = GoogleFonts.dmSans(
    color: AppColors.gray,
    fontWeight: FontWeight.w400,
  );

  static TextStyle graySemiBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.gray,
    fontWeight: FontWeight.w600,
  );

  static TextStyle grayBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.gray,
    fontWeight: FontWeight.w700,
  );

  // white
  static TextStyle whiteRegularTextStyle = GoogleFonts.dmSans(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteLightTextStyle = GoogleFonts.dmSans(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle whiteSemiBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle whiteBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  // Red
  static TextStyle errorRegularTextStyle = GoogleFonts.dmSans(
    color: AppColors.error,
    fontWeight: FontWeight.w500,
  );

  static TextStyle errorLightTextStyle = GoogleFonts.dmSans(
    color: AppColors.error,
    fontWeight: FontWeight.w400,
  );

  static TextStyle errorSemiBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.error,
    fontWeight: FontWeight.w600,
  );

  static TextStyle errorBoldTextStyle = GoogleFonts.dmSans(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );
}
