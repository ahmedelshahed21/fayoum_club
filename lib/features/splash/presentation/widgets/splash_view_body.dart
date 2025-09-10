import 'package:fayoum_club/core/utils/app_assets.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
// import 'package:fayoum_club/core/databases/cache/app_data_manager.dart';
import 'package:fayoum_club/core/functions/navigation.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
// import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _checkUserStatusAndNavigate();
  }

  Future<void> _checkUserStatusAndNavigate() async {
    final userCubit = context.read<UserSessionCubit>();
    // final appDataManager = getIt<AppDataManager>();
    // bool isSelectLanguageViewVisited =
    //     appDataManager.getIsSelectLanguageViewVisited() ?? false;
    await userCubit.checkIfGuest();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      if (userCubit.state.isGuest == true) {
        customGo(context, AppRouter.loginView);
      } else if (userCubit.state.isGuest == false) {
        customGo(context, AppRouter.homePage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(128),
          color: AppColors.pureWhiteColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Image.asset(AppAssets.logo, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
