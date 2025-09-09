import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/custom_list_tile_widget.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/profile/presentation/widget/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isGuest =
        context.select<UserSessionCubit, bool>((cubit) => cubit.state.isGuest);
    return isGuest
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(16),
              Text(
                AppStrings.login.tr(),
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.pureBlackColor),
              ),
              const VerticalSpace(8),
              CustomListTileWidget(
                iconData: Iconsax.login_copy,
                // svgPath: AppAssets.loginIcon,
                title: AppStrings.login.tr(),
                onPressed: () {
                  customGo(context, AppRouter.loginView);
                },
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(16),
              Text(
                AppStrings.logout.tr(),
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: AppColors.pureBlackColor),
              ),
              const VerticalSpace(8),
              CustomListTileWidget(
                iconData: Iconsax.logout_copy,
                // svgPath: AppAssets.logoutIcon,
                title: AppStrings.logout.tr(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const LogoutDialog();
                    },
                  );
                },
              ),
            ],
          );
  }
}
