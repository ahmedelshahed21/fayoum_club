import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

OutlineInputBorder buildOutlineInputBorder({
  Color? color,
  double? radius,
  double? width,
}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color ?? Colors.transparent,
      width: width ?? 1,
    ),
    borderRadius: BorderRadius.circular(radius ?? 8),
  );
}

UnderlineInputBorder buildUnderlineInputBorder({Color? color}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(width: 1.5, color: color ?? AppColors.offGreyColor),
  );
}
