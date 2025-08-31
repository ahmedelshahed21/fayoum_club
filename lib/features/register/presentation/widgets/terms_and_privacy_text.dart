import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';

class TermsAndPrivacyText extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsAndPrivacyText({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: AppStyles.styleMedium14(context),
        children: [
          TextSpan(text: AppStrings.createAccountDisclaimer.tr()),
          TextSpan(
            text: AppStrings.termsOfUse.tr(),
            style: AppStyles.styleMedium14(
              context,
            ).copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),
          TextSpan(
            text: ' ${AppStrings.and.tr()} ',
            style: AppStyles.styleMedium14(context),
          ),
          TextSpan(
            text: AppStrings.privacyPolicy.tr(),
            style: AppStyles.styleMedium14(
              context,
            ).copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),
        ],
      ),
    );
  }
}
