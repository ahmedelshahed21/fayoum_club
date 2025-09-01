import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/functions/is_arabic.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';

class MoreViewHeader extends StatelessWidget {
  const MoreViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDataManager userData = getIt<UserDataManager>();
    return Material(
      color: AppColors.pureWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: AppColors.lightGreyColor,
        highlightColor: AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // customPush(context, AppRouter.profileView);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.primaryColor,
                backgroundImage:  const AssetImage("assets/images/man.png"),
              ),
              const HorizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: isArabic(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        userData.getUserName()??'ll',
                        style: AppStyles.styleExtraBold18(context)
                            .copyWith(color: AppColors.pureBlackColor),
                      ),
                    ),
                    const VerticalSpace(4),
                    Text(
                      userData.getUserPhoneNumber()??'n',
                      style: AppStyles.styleSemiBold18(context)
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 28,
                color: AppColors.primaryColor.withValues(alpha: 0.6),
              )
            ],
          ),
        ),
      ),
    );
  }
}
