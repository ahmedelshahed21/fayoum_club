import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ConfirmationDialogWithHorizontalButtons extends StatelessWidget {
  final String? iconAsset;
  final IconData? iconData;
  final String title;
  final String? message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final bool isLoading;
  final int? firstButtonFlex;
  final int? secondButtonFlex;

  const ConfirmationDialogWithHorizontalButtons({
    super.key,
    this.iconAsset,
    this.iconData,
    required this.title,
    this.message,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    this.isLoading = false,
    this.firstButtonFlex,
    this.secondButtonFlex,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.offWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconData == null && iconAsset != null
                ? SvgPicture.asset(
              iconAsset!,
              height: 100,
              colorFilter:
              ColorFilter.mode(AppColors.pureBlackColor, BlendMode.srcIn),
            )
                : Icon(iconData, size: 110, color: AppColors.pureBlackColor),
            const VerticalSpace(24),
            Text(
              title,
              style: AppStyles.styleSemiBold20(context).copyWith(
                color: AppColors.pureBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
            message == null
                ? const SizedBox.shrink()
                : Column(
              children: [
                const VerticalSpace(8),
                Text(
                  message!,
                  style: AppStyles.styleMedium18(context).copyWith(
                    color: AppColors.greyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const VerticalSpace(32),
            isLoading
                ? Center(
                child: PrimaryCircularProgressIndicator(
                    color: AppColors.primaryColor))
                : Row(
              children: [
                Expanded(
                  flex: firstButtonFlex ?? 5,
                  child: ActionButton(
                    borderColor: AppColors.primaryColor,
                    backgroundColor: AppColors.pureWhiteColor,
                    onPressed: onConfirm,
                    child: Text(
                      confirmText,
                      style: AppStyles.styleSemiBold20(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const HorizontalSpace(12),
                Expanded(
                  flex: secondButtonFlex ?? 3,
                  child: ActionButton(
                    text: cancelText,
                    textColor: AppColors.pureWhiteColor,
                    onPressed: onCancel,
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

