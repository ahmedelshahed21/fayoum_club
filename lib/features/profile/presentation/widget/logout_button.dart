import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/state_management/user_cubit/user_session_cubit.dart';
import '../../../../core/state_management/user_cubit/user_session_state.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onTap;

  const LogoutButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.pureWhiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.power_settings_new,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              BlocBuilder<UserSessionCubit, UserSessionState>(
                builder: (context, state) {
                  return Text(
                    state.isGuest ? AppStrings.login.tr() : AppStrings.logout
                        .tr(),
                    style: AppStyles.styleBold18(context).copyWith(
                      color: AppColors.pureWhiteColor,
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
