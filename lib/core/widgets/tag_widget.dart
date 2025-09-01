import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag,
        style: AppStyles.styleMedium14(context).copyWith(
          color: AppColors.pureBlackColor,
        ),
      ),
    );
  }
}