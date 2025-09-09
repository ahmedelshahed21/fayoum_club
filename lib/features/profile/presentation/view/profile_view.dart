import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/widgets/app_app_bars.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/profile/presentation/widget/profile_image.dart';
import 'package:fayoum_club/features/profile/presentation/widget/profile_info_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../core/databases/cache/user_data_manager.dart';
import '../../../../core/services/service_locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDataManager userData = getIt<UserDataManager>();
    return Scaffold(
      appBar: PrimaryAppBar(title: AppStrings.profile.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const ProfileImage(),
            const VerticalSpace(20),
            ProfileInfoContainer(
              labelText: AppStrings.name.tr(),
              valueText:
              userData.getUserName()!,
            ),
            const VerticalSpace(12),
            ProfileInfoContainer(
              labelText: AppStrings.phoneNumber.tr(),
              valueText: userData.getUserPhoneNumber()!,
            ),
            const VerticalSpace(12),
            ProfileInfoContainer(
              labelText: AppStrings.email.tr(),
              valueText: userData.getUserEmail()!,
            ),
            const VerticalSpace(12),
            ProfileInfoContainer(
              labelText: AppStrings.password.tr(),
              valueText: "********",
            ),
            const VerticalSpace(16),
            userData.getUserMembership() != null ? Icon(Iconsax.verify,color: AppColors.primaryColor,size: 96,):SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
