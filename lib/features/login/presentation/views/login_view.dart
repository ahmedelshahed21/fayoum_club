import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_name_and_logo_widget.dart';
import 'package:fayoum_club/core/widgets/have_an_account.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/login/presentation/widgets/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace(4),
              AppNameAndLogoWidget(title: AppStrings.welcomeBack.tr()),
              const VerticalSpace(16),
              const LoginForm(),
              const VerticalSpace(12),
              const Spacer(),
              SecondaryButton(
                  text: AppStrings.continueAsAGuest.tr(),
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.read<BottomNavigationBarCubit>().changeIndex(0);
                    context.read<UserSessionCubit>().setGuestStatus(isGuest: true);
                    customGo(context, AppRouter.homePage);
                  }),

              HaveAnAccount(
                text: AppStrings.doNotHaveAnAccount.tr(),
                textButton: AppStrings.signUp.tr(),
                onPressed: () {
                  customPush(context, AppRouter.registerView);
                },
              ),
              const VerticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}
