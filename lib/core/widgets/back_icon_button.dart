import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key, this.iconColor});
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 28,
      onPressed: () {
        GoRouter.of(context).pop();
      },
      color: iconColor ?? AppColors.pureWhiteColor,
      icon: Icon(
       Icons.arrow_back_ios_outlined,
        size: 28,
      ),
    );
  }
}
