import 'package:fayoum_club/core/constants/app_assets.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/show_login_is_required_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuestCircleAvatar extends StatelessWidget {
  const GuestCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showLoginIsRequiredDialog(context);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.lightGreyColor,
            child: SvgPicture.asset(
              AppAssets.profileIcon,
              height: 48,
              colorFilter: ColorFilter.mode(
                AppColors.pureBlackColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            'Guest',
            style: AppStyles.styleSemiBold20(
              context,
            ).copyWith(color: AppColors.pureBlackColor),
          ),
        ],
      ),
    );
  }
}
