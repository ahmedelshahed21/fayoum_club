import 'package:flutter/material.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.styleBold14(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
        Center(
          child: Text(
            value,
            style: AppStyles.styleBold24(
              context,
            ).copyWith(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
