import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core/utils/app_colors.dart';
import '../core/routes/app_router.dart';
import '../core/services/service_locator.dart';
import '../core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import '../core/state_management/network_connection_cubit/network_connection_cubit.dart';
import '../core/state_management/user_cubit/user_session_cubit.dart';

class FayoumClubApp extends StatelessWidget {
  const FayoumClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserSessionCubit>(create: (_) => UserSessionCubit()),
        BlocProvider<NetworkConnectionCubit>(
          create: (_) => getIt<NetworkConnectionCubit>(),
        ),
        BlocProvider<BottomNavigationBarCubit>(
          create: (_) => BottomNavigationBarCubit(),
        ),
        BlocProvider<BannersCubit>(
          create: (_) => getIt<BannersCubit>()..getBanners(),
        ),
        BlocProvider<NewsCubit>(create: (_) => getIt<NewsCubit>()..fetchNews()),
        BlocProvider<ActivitiesCubit>(
          create: (_) => getIt<ActivitiesCubit>()..getActivites(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.primaryColor.withAlpha(40),
            selectionHandleColor: AppColors.primaryColor,
            cursorColor: AppColors.primaryColor,
          ),
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColors.primaryColor,
          ),
          appBarTheme: AppBarTheme(backgroundColor: AppColors.pureWhiteColor),
          scaffoldBackgroundColor: AppColors.offWhiteColor,
        ),
        builder: FToastBuilder(),
      ),
    );
  }
}
