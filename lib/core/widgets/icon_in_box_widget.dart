import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class IconInBoxWidget extends StatelessWidget {
  const IconInBoxWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: child),
    );
  }
}
