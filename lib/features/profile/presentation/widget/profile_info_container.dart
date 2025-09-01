import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/is_arabic.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';


class ProfileInfoContainer extends StatelessWidget {
  final String labelText;
  final String valueText;

  const ProfileInfoContainer({
    super.key,
    required this.labelText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppStyles.styleSemiBold12(context)
              .copyWith(color: AppColors.greyColor),
        ),
        const VerticalSpace(4),
        Container(
          width: double.infinity,
        //  constraints: const BoxConstraints(maxHeight: 50),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Align(
            alignment: isArabic(context) ?Alignment.centerRight : Alignment.centerLeft,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                valueText,
                style: AppStyles.styleBold18(context)
                    .copyWith(color: AppColors.pureBlackColor),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
