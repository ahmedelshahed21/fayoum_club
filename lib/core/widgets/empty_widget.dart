import 'package:flutter/material.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.directions_bus_filled,
          size: 128,
          color: AppColors.offGreyColor,
        ),
        const VerticalSpace(16),
        Center(
          child: Text(
            "No buses found",
            style: AppStyles.styleBold24(
              context,
            ).copyWith(color: AppColors.offGreyColor),
          ),
        ),
      ],
    );
  }
}
