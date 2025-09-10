import 'package:flutter/material.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    super.key,
    required this.onTap,
    required this.text,
    required this.textStyle,
  });

  final void Function() onTap;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      splashColor: AppColors.offWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
