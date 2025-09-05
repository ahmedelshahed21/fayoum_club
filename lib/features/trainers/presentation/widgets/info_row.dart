import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleBold18(context)
              .copyWith(color: AppColors.pureBlackColor),
        ),
        Text(
          value,
          style: AppStyles.styleRegular14(context)
              .copyWith(color: AppColors.greyColor),
        ),
      ],
    );
  }
}
