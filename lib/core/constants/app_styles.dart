import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_fonts.dart';
import 'package:fayoum_club/core/functions/is_arabic.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.lightBlackColor,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 15 : 16,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.lightBlackColor,
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 17 : 18,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.greyColor,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 18 : 20,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleRegular32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 30 : 32,
      ),
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureWhiteColor,
    );
  }

  // Medium (FontWeight.w500)
  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.greyColor,
    );
  }

  static TextStyle styleMedium15(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 13 : 15,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.greyColor,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 15 : 16,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 17 : 18,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 19 : 20,
      ),
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  // SemiBold (FontWeight.w600)
  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 13 : 14,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 15 : 16,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 17 : 18,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 19 : 20,
      ),
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureWhiteColor,
    );
  }

  // Bold (FontWeight.w700)
  static TextStyle styleBold10(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor.withValues(alpha: 0.8),
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor.withValues(alpha: 0.8),
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 17 : 18,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor.withValues(alpha: 0.8),
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 19 : 20,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 22 : 24,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor.withValues(alpha: 0.8),
    );
  }

  static TextStyle styleBold32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 30 : 32,
      ),
      fontWeight: FontWeight.w700,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  // ExtraBold (FontWeight.w800)
  static TextStyle styleExtraBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 15 : 16,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleExtraBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 17 : 18,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle styleExtraBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 19 : 20,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureWhiteColor,
    );
  }

  static TextStyle styleExtraBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 23 : 24,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureWhiteColor,
    );
  }

  static TextStyle styleExtraBold22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 20 : 22,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle styleExtraBold28(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 26 : 28,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle styleExtraBold32(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(
        context,
        fontSize: isArabic(context) ? 30 : 32,
      ),
      fontWeight: FontWeight.w800,
      fontFamily: AppFonts.almaraiFont,
      color: AppColors.pureBlackColor,
    );
  }

  static TextStyle stylefayoum_clubApp(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontWeight: FontWeight.w900,
      fontFamily: AppFonts.lobsterFont,
      color: AppColors.pureBlackColor,
    );
  }
}

// Scale Factor - Responsive Font Size
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double min = fontSize * .8;
  double max = fontSize * 1.2;

  return responsiveFontSize.clamp(min, max);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;
  double width = MediaQuery.sizeOf(context).width;
  if (width < 700) {
    return width / 370;
  } else if (width < 1300) {
    return width / 950;
  } else {
    return width / 1700;
  }
}
