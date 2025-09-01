import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/custom_list_tile_widget.dart';
import '../../../../core/widgets/spacing.dart';

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(16),
          Text(
            AppStrings.help.tr(),
            style: AppStyles.styleExtraBold16(
              context,
            ).copyWith(color: AppColors.pureBlackColor),
          ),

          const VerticalSpace(8),
          CustomListTileWidget(
            title: AppStrings.getInTouch.tr(),
            svgPath: AppAssets.phoneIcon,
            onPressed: () {
              customPush(context, AppRouter.contactUsView);
            },
          ),

        ]
    );
  }
}
