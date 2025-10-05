import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/functions/app_snack_bars.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/app_text_fields.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/login/presentation/manager/login_cubit.dart';
import 'package:fayoum_club/features/login/presentation/manager/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isSecure = true;
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? oneSignalToken;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            // context.read<OneSignalCubit>().sendOneSignalToken(
            //       oneSignalToken: oneSignalToken!,
            //     );
            context.read<UserSessionCubit>().setGuestStatus(isGuest: false);
            context.read<BottomNavigationBarCubit>().changeIndex(0);
            customGo(context, AppRouter.homePage);
          } else if (state is LoginFailureState) {
            primarySnackBar(
              context,
              state.failedModel.message,
              icon: Icons.error_outline,
              boxColor: AppColors.redColor,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              PrimaryTextFormField(
                labelText: AppStrings.phoneNumber.tr(),
                type: TextInputType.phone,
                controller: _phoneNumberController,
              ),

              PrimaryTextFormField(
                labelText: AppStrings.password.tr(),
                controller: _passwordController,
                obscureText: isSecure,
                maxLines: 1,
                suffixIcon: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                  icon: Icon(
                    isSecure ? Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    size: 24,
                  ),
                ),
              ),
              const VerticalSpace(24),
              state is LoginLoadingState
                  ? PrimaryButton(
                    child: const PrimaryCircularProgressIndicator(),
                    onPressed: () {},
                  )
                  : PrimaryButton(
                    text: AppStrings.login.tr(),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<LoginCubit>().login(
                        phoneNumber: _phoneNumberController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                    },
                  ),
            ],
          );
        },
      ),
    );
  }
}
