import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_fonts.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void fayoum_clubToast(
  BuildContext context,
  String message, {
  Color? backgroundColor,
  Color? textColor,
}) {
  FToast fToast = FToast();
  fToast.init(context);

  fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: Text(
          message,
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: textColor ?? AppColors.pureWhiteColor,
            fontFamily: AppFonts.almaraiFont,
          ),
        ),
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 3),
  );
}
