import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

void primarySnackBar(
  BuildContext context,
  String message, {
  IconData? icon,
  double? iconSize,
  Color? boxColor,
  Color? iconColor,
  int? durationInSeconds,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.pureBlackColor,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      duration: Duration(seconds: durationInSeconds ?? 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon != null
              ? Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: boxColor ?? AppColors.greenColor,
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.pureWhiteColor,
                  size: iconSize ?? 22,
                ),
              )
              : const SizedBox(),
          const HorizontalSpace(8),
          message.length <= 32
              ? Text(
                message,
                style: AppStyles.styleSemiBold16(
                  context,
                ).copyWith(color: AppColors.offWhiteColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
              : SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    message,
                    style: AppStyles.styleSemiBold16(
                      context,
                    ).copyWith(color: AppColors.offWhiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
        ],
      ),
    ),
  );
}

void secondarySnackBar(
  BuildContext context,
  String message, {
  IconData? icon,
  double? iconSize,
  Color? boxColor,
  Color? iconColor,
  int? durationInSeconds,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.pureBlackColor,
      elevation: 0,
      duration: Duration(seconds: durationInSeconds ?? 3),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 72),
      padding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.pureBlackColor.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color:
                        boxColor ??
                        AppColors.pureWhiteColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(64),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? AppColors.pureWhiteColor,
                    size: iconSize ?? 22,
                  ),
                ),
              const HorizontalSpace(4),
              Flexible(
                child: Text(
                  message,
                  style: AppStyles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.pureWhiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void redirectedSnackBar(
  BuildContext context, {
  String? message,
  IconData? icon,
  Color? iconColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * 0.4,
        horizontal: 16,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(color: AppColors.pureWhiteColor),
          ),
          const HorizontalSpace(32),
          Flexible(
            child: Text(
              message ?? '',
              style: AppStyles.styleExtraBold20(
                context,
              ).copyWith(color: AppColors.offWhiteColor),
            ),
          ),
        ],
      ),
    ),
  );
}
