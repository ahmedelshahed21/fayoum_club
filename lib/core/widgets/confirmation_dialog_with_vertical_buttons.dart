import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';

class ConfirmationDialogWithVerticalButtons extends StatelessWidget {
  final String iconAsset;
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isLoading;

  const ConfirmationDialogWithVerticalButtons({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.pureWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconAsset,
              height: 120,
              colorFilter: ColorFilter.mode(
                AppColors.greyColor,
                BlendMode.srcIn,
              ),
            ),
            const VerticalSpace(24),
            Text(
              title,
              style: AppStyles.styleSemiBold18(
                context,
              ).copyWith(color: AppColors.pureBlackColor),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(12),
            Text(
              message,
              style: AppStyles.styleMedium14(
                context,
              ).copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.center,
            ),
            const VerticalSpace(24),
            isLoading
                ? Center(
                  child: Column(
                    children: [
                      const VerticalSpace(16),
                      Center(
                        child: PrimaryCircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const VerticalSpace(16),
                    ],
                  ),
                )
                : Column(
                  children: [
                    NextButton(onPressed: onConfirm, text: confirmText),
                    const VerticalSpace(8),
                    GoButton(
                      onPressed: onCancel,
                      backgroundColor: AppColors.pureWhiteColor,
                      child: Text(
                        cancelText,
                        style: AppStyles.styleSemiBold16(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
