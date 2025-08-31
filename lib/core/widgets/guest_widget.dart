import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_assets.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: CircleAvatar(
              radius: 72,
              backgroundColor: AppColors.lightGreyColor,
              child: SvgPicture.asset(
                AppAssets.userIcon,
                height: 72,
                colorFilter: ColorFilter.mode(
                  AppColors.pureWhiteColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const VerticalSpace(16),
          Text(
            'Guest',
            style: AppStyles.styleSemiBold20(
              context,
            ).copyWith(color: AppColors.pureBlackColor),
          ),
          const Spacer(flex: 4),
          GoButton(
            text: AppStrings.login.tr(),
            onPressed: () {
              customGo(context, AppRouter.loginView);
            },
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
