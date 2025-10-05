import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
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
import 'package:fayoum_club/features/register/data/models/register_data_model.dart';
import 'package:fayoum_club/features/register/presentation/manager/register_cubit.dart';
import 'package:fayoum_club/features/register/presentation/manager/register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordObscured = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _membershipCode = TextEditingController();

  String? oneSignalToken;
  String selectedGender = "male";
  bool isMember = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            context.read<UserSessionCubit>().setGuestStatus(isGuest: false);
            context.read<BottomNavigationBarCubit>().changeIndex(0);
            customGo(context, AppRouter.homePage);
          } else if (state is RegisterFailureState) {
            primarySnackBar(
              context,
              state.failedModel.errors.first,
              icon: Icons.error_outline,
              boxColor: AppColors.redColor,
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryTextFormField(
                labelText: AppStrings.name.tr(),
                controller: _nameController,
              ),
              PrimaryTextFormField(
                maxLength: 11,
                labelText: AppStrings.phoneNumber.tr(),
                type: TextInputType.phone,
                controller: _phoneController,
              ),
              PrimaryTextFormField(
                labelText: AppStrings.email.tr(),
                type: TextInputType.emailAddress,
                controller: _emailController,
              ),
              PrimaryTextFormField(
                maxLines: 1,
                labelText: AppStrings.password.tr(),
                controller: _passwordController,
                obscureText: isPasswordObscured,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordObscured = !isPasswordObscured;
                    });
                  },
                  icon: Icon(
                    isPasswordObscured
                        ? Iconsax.eye_slash_copy
                        : Iconsax.eye_copy,
                    size: 24,
                  ),
                ),
              ),
              Text(AppStrings.gender.tr(), style: AppStyles.styleMedium16(context)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: "male",
                      groupValue: selectedGender,
                      activeColor: AppColors.primaryColor,
                      title: Text(
                        AppStrings.male.tr(),
                        style: AppStyles.styleRegular16(context),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: "female",
                      groupValue: selectedGender,
                      activeColor: AppColors.primaryColor,
                      title: Text(
                        AppStrings.female.tr(),
                        style: AppStyles.styleRegular16(context),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                AppStrings.isClubMember.tr(),
                style: AppStyles.styleMedium16(context),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      value: true,
                      groupValue: isMember,
                      activeColor: AppColors.primaryColor,
                      title: Text(
                        AppStrings.yes.tr(),
                        style: AppStyles.styleRegular16(context),
                      ),
                      onChanged: (value) {
                        setState(() => isMember = value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      value: false,
                      groupValue: isMember,
                      activeColor: AppColors.primaryColor,
                      title: Text(
                        AppStrings.no.tr(),
                        style: AppStyles.styleRegular16(context),
                      ),
                      onChanged: (value) {
                        setState(() => isMember = value!);
                      },
                    ),
                  ),
                ],
              ),
              if (isMember)
                PrimaryTextFormField(
                  labelText: AppStrings.membershipNumber.tr(),
                  controller: _membershipCode,
                ),
              const VerticalSpace(32),

              state is RegisterLoadingState
                  ? PrimaryButton(
                    child: const PrimaryCircularProgressIndicator(),
                    onPressed: () {},
                  )
                  : PrimaryButton(
                    text: AppStrings.signUp.tr(),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      final registerData = RegisterDataModel(
                        name: _nameController.text,
                        email: _emailController.text,
                        phoneNumber: _phoneController.text,
                        password: _passwordController.text,
                        isMember: isMember ? 1 : 0,
                        code: isMember ? _membershipCode.text : null,
                        gender: selectedGender,
                      );

                      context.read<RegisterCubit>().register(registerData);
                    },
                  ),
            ],
          );
        },
      ),
    );
  }
}
