import 'package:fayoum_club/core/constants/app_assets.dart';
import 'package:fayoum_club/core/constants/app_colors.dart' show AppColors;
import 'package:fayoum_club/core/constants/app_styles.dart' show AppStyles;
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class LanguageSelectionTile extends StatelessWidget {
  const LanguageSelectionTile({
    super.key,
    required this.onChangEnglish,
    required this.onChangArabic,
    this.groupValue,
  });

  final String? groupValue;
  final void Function(String?) onChangEnglish;
  final void Function(String?) onChangArabic;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () => onChangArabic('ar'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: ShapeDecoration(
                color:
                    groupValue == 'ar'
                        ? AppColors.pureWhiteColor
                        : AppColors.pureWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color:
                        groupValue == 'ar'
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      AppAssets.arImage,
                      height: 48,
                      width: 48,
                    ),
                  ),
                  const HorizontalSpace(12),
                  Text(
                    'العربية',
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color:
                          groupValue == 'ar'
                              ? AppColors.greyColor
                              : AppColors.lightGreyColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    groupValue == 'ar'
                        ? Icons.check_circle_outline
                        : Icons.check_circle_outline,
                    color:
                        groupValue == 'ar'
                            ? AppColors.primaryColor
                            : AppColors.lightGreyColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        const VerticalSpace(18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () => onChangEnglish('en'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: ShapeDecoration(
                color:
                    groupValue == 'ar'
                        ? AppColors.pureWhiteColor
                        : AppColors.pureWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color:
                        groupValue == 'en'
                            ? AppColors.primaryColor
                            : Colors.grey.shade300,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(AppAssets.enImage, height: 48, width: 48),
                  const HorizontalSpace(12),
                  Text(
                    'English',
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color:
                          groupValue == 'en'
                              ? AppColors.greyColor
                              : AppColors.lightGreyColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    groupValue == 'en'
                        ? Icons.check_circle_outline_outlined
                        : Icons.check_circle_outline_outlined,
                    color:
                        groupValue == 'en'
                            ? AppColors.primaryColor
                            : AppColors.lightGreyColor.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
