import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/app_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/functions/is_arabic.dart';
import '../../../../core/functions/darbi_snack_bars.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/spacing.dart';
import '../manger/change_password_cubit/change_password_cubit.dart';
import '../manger/change_password_cubit/change_password_state.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool isSecure1 = true;
  bool isSecure2 = true;
  bool isSecure3 = true;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            primarySnackBar(
              context,
              isArabic(context)
                  ? state.success.message.ar
                  : state.success.message.en,
              icon: Icons.check_circle,
              boxColor: AppColors.greenColor,
            );
          } else if (state is ChangePasswordFailure) {
            primarySnackBar(
              context,
              state.error.errors.first,
              icon: Icons.error_outline_outlined,
              boxColor: AppColors.redColor,
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const VerticalSpace(16),
              SecondaryTextFormField(
                // svgPath: AppAssets.lockIcon,
                fieldName: AppStrings.password.tr(),
                hintText: AppStrings.password.tr(),
                // type: TextInputType.visiblePassword,
                controller: _currentPasswordController,
                obscureText: isSecure1,
                maxLines: 1,
                suffixIcon: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      isSecure1 = !isSecure1;
                    });
                  },
                  icon: Icon(
                    color: AppColors.greyColor,
                    isSecure1
                        ?  Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    size: 24,
                  ),
                ),
              ),
              const VerticalSpace(16),
              SecondaryTextFormField(
                // svgPath: AppAssets.lockIcon,
                fieldName: AppStrings.newPassword.tr(),
                hintText: AppStrings.newPassword.tr(),
                // type: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: isSecure2,
                maxLines: 1,
                suffixIcon: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      isSecure2 = !isSecure2;
                    });
                  },
                  icon: Icon(
                    color: AppColors.greyColor,
                    isSecure2
                        ?  Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    size: 24,
                  ),
                ),
              ),
              const VerticalSpace(16),
              SecondaryTextFormField(
                // svgPath: AppAssets.lockIcon,
                fieldName: AppStrings.confirmNewPassword.tr(),
                hintText: AppStrings.confirmNewPassword.tr(),
                // type: TextInputType.visiblePassword,
                controller: _confirmPasswordController,
                obscureText: isSecure3,
                maxLines: 1,
                suffixIcon: IconButton(
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      isSecure3 = !isSecure3;
                    });
                  },
                  icon: Icon(
                    color: AppColors.greyColor,
                    isSecure3
                        ?  Iconsax.eye_slash_copy : Iconsax.eye_copy,
                    size: 24,
                  ),
                ),
              ),
              const VerticalSpace(48),
              state is ChangePasswordLoading
                  ? PrimaryButton(
                      child: const PrimaryCircularProgressIndicator(),
                      onPressed: () {},
                    )
                  : PrimaryButton(
                      text: AppStrings.save.tr(),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // context.read<ChangePasswordCubit>().changePassword(
                        //         data: ChangePasswordRequestModel(
                        //       currentPassword: _currentPasswordController.text,
                        //       newPassword: _passwordController.text,
                        //       newPasswordConfirmation:
                        //           _confirmPasswordController.text,
                        //     ));
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
