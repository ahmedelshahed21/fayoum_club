import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/features/activites/presentation/views/activities_view.dart';
import 'package:fayoum_club/features/home/presentation/views/home_view.dart';
import 'package:fayoum_club/features/more/presentation/views/more_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> views = [
      const HomeView(),
      const ActivitiesView(),
      const MoreView(),
    ];

    return BlocBuilder<BottomNavigationBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(child: views[state]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) {
              context.read<BottomNavigationBarCubit>().changeIndex(index);
            },
            selectedLabelStyle: AppStyles.styleSemiBold12(context),
            unselectedLabelStyle: AppStyles.styleSemiBold12(context),
            backgroundColor: AppColors.pureWhiteColor,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.lightGreyColor,
            type: BottomNavigationBarType.fixed,
            items: [
              buildNavItem(
                icon: Iconsax.home_1,
                name: AppStrings.home.tr(),
                state == 0,
              ),
              buildNavItem(
                icon: Iconsax.category_2,
                name: 'الأنشطة',
                state == 1,
              ),
              buildNavItem(
                icon: Iconsax.profile_circle,
                name: AppStrings.account.tr(),
                state == 2,
              ),
            ],
          ),
        );
      },
    );
  }

  BottomNavigationBarItem buildNavItem(
    bool isSelected, {
    required IconData icon,
    required String name,
  }) {
    return BottomNavigationBarItem(label: name, icon: Icon(icon));
  }
}
