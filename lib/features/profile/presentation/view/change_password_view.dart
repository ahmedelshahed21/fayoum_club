import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/widgets/app_app_bars.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../widget/change_password_form.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: AppStrings.changePassword.tr(),
        backgroundColor: AppColors.offWhiteColor,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            VerticalSpace(12),
            ChangePasswordForm(),
            VerticalSpace(24),
          ],
        ),
      ),
    );
  }
}
