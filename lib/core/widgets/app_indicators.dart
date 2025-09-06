import 'package:fayoum_club/core/constants/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';

class PrimaryCircularProgressIndicator extends StatelessWidget {
  const PrimaryCircularProgressIndicator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: CircularProgressIndicator(
        color: color ?? AppColors.pureWhiteColor,
        strokeWidth: 2.5,
        strokeAlign: 2,
      ),
    );
  }
}

class PrimaryRefreshIndicator extends StatelessWidget {
  const PrimaryRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      elevation: 0,
      strokeWidth: 2.5,
      backgroundColor: AppColors.primaryColor,
      color: AppColors.pureWhiteColor,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
