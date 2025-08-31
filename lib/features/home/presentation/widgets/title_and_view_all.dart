import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:flutter/material.dart';

class TitleAndViewAll extends StatelessWidget {
  const TitleAndViewAll({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.pureBlackColor),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: ()=> runIfConnected(context: context, onConnected: onPressed),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
            child: Text(
              'عرض الكل',
              style: AppStyles.styleMedium14(context)
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
