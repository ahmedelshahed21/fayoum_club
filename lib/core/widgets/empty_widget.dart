import 'package:flutter/material.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Iconsax.info_circle_copy,
          size: 64,
          color: AppColors.greyColor,
        ),
        const VerticalSpace(16),
        Center(
          child: Text(
            title,
            style: AppStyles.styleBold24(context)
                .copyWith(color: AppColors.greyColor),
          ),
        ),
      ],
    );
  }
}


