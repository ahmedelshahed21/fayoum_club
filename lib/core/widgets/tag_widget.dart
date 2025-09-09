import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    this.tag,
    this.backgroundColor,
    this.textColor,
  });

  final String? tag;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return tag!=null ? Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.offWhiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag!,
        style: AppStyles.styleMedium14(
          context,
        ).copyWith(color: textColor ?? AppColors.primaryColor),
      ),
    ):SizedBox.shrink();
  }
}
