import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/functions/is_arabic.dart';
import 'package:fayoum_club/core/functions/run_if_connected.dart';
import 'package:flutter/material.dart';

class NavigateToNewView extends StatelessWidget {
  const NavigateToNewView({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.primaryColor,
      ),
      child: IconButton(
        splashColor: AppColors.pureWhiteColor,
        highlightColor: AppColors.lightGreyColor.withValues(alpha: 0.2),
        onPressed:
            () => runIfConnected(context: context, onConnected: onPressed),
        icon: Icon(
          isArabic(context)
              ? Icons.keyboard_arrow_left_outlined
              : Icons.keyboard_arrow_right_outlined,
          color: AppColors.pureWhiteColor,
          size: 32,
        ),
      ),
    );
  }
}
