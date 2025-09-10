import 'package:fayoum_club/core/utils/app_assets.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppNameAndLogoWidget extends StatelessWidget {
  const AppNameAndLogoWidget({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
              title!,
              style: AppStyles.styleSemiBold18(
                context,
              ).copyWith(color: AppColors.pureBlackColor),
            )
            : const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(backgroundImage: AssetImage(AppAssets.logo)),
            const HorizontalSpace(8),
            Text(
              AppStrings.appName.tr(),
              style: AppStyles.stylefayoum_clubApp(context),
            ),
          ],
        ),
      ],
    );
  }
}
