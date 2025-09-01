import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';

import '../../../../core/widgets/custom_list_tile_widget.dart';
import '../../../../core/widgets/spacing.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(16),
          Text(
            AppStrings.account.tr(),
            style: AppStyles.styleExtraBold16(
              context,
            ).copyWith(color: AppColors.pureBlackColor),
          ),
          const VerticalSpace(8),
          CustomListTileWidget(
            title: AppStrings.profile.tr(),
            iconData: Iconsax.profile_circle_copy,
            onPressed: () {
              customPush(context, AppRouter.profileView);
            },
          ),

          // CustomListTileWidget(
          //   title: AppStrings.qrCode,
          //   iconData: Icons.qr_code_2,
          //   onPressed: () {
          //     customPush(context, AppRouter.qrCodeView);
          //   },
          // ),
        ]
    );
  }
}
