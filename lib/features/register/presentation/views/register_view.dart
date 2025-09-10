import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/widgets/app_name_and_logo_widget.dart';
import 'package:fayoum_club/core/widgets/have_an_account.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/register/presentation/widgets/register_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(12),
              AppNameAndLogoWidget(title: AppStrings.signUpToJoin.tr()),
              const VerticalSpace(24),
              const RegisterForm(),
              const VerticalSpace(8),
              HaveAnAccount(
                text: AppStrings.alreadyHaveAnAccount.tr(),
                textButton: AppStrings.login.tr(),
                onPressed: () {
                  customPush(context, AppRouter.loginView);
                },
              ),
              const VerticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
