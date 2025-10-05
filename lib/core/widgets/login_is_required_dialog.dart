import 'package:fayoum_club/core/utils/app_assets.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginIsRequiredDialog extends StatelessWidget {
  const LoginIsRequiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.offWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.loginIcon,
              height: 128,
              colorFilter: ColorFilter.mode(
                AppColors.pureBlackColor,
                BlendMode.srcIn,
              ),
            ),
            const VerticalSpace(24),
            FittedBox(
              child: Text(
                AppStrings.loginIsRequired.tr(),
                style: AppStyles.styleExtraBold24(
                  context,
                ).copyWith(color: AppColors.pureBlackColor),
                textAlign: TextAlign.center,
              ),
            ),
            const VerticalSpace(6),
            FittedBox(
              child: Text(
                AppStrings.pleaseLogInToContinue.tr(),
                style: AppStyles.styleMedium16(
                  context,
                ).copyWith(color: AppColors.greyColor),
                textAlign: TextAlign.center,
              ),
            ),
            const VerticalSpace(32),
            PrimaryButton(
              onPressed: () {
                customGo(context, AppRouter.loginView);
              },
              text: AppStrings.login.tr(),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Expanded(
            //       flex: 2,
            //       child: SecondaryButton(
            //         borderColor: AppColors.primaryColor,
            //         backgroundColor: AppColors.pureWhiteColor,
            //         onPressed: () {
            //           GoRouter.of(context).pop();
            //         },
            //         child: Text(
            //           textAlign: TextAlign.center,
            //           AppStrings.back.tr(),
            //           style: AppStyles.styleSemiBold20(context)
            //               .copyWith(color: AppColors.primaryColor),
            //         ),
            //       ),
            //     ),
            //     const HorizontalSpace(16),
            //     Expanded(
            //       flex: 3,
            //       child: SecondaryButton(
            //           borderColor: AppColors.primaryColor,
            //           backgroundColor: AppColors.primaryColor,
            //           child: Text(AppStrings.login.tr(),
            //             style: AppStyles.styleSemiBold20(context),
            //           ),
            //           onPressed: () {
            //             GoRouter.of(context).go(AppRouter.loginView);
            //           }),
            //     ),
            //   ],
            // ),
            const VerticalSpace(12),
          ],
        ),
      ),
    );
  }
}
