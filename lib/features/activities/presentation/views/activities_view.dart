import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:fayoum_club/features/activities/presentation/widgets/activities_grid_view_section.dart';
import 'package:flutter/material.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  final List<String> tabs = [
    "الكل",
    "ألعاب فردية ومنازلات",
    "ألعاب جماعية",
    "ألعاب المضرب",
    "لياقة بدنية",
    "رياضات مائية",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            color: AppColors.offWhiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalSpace(12),
                Text(
                  "الأنشطة",
                  style: AppStyles.styleBold18(
                    context,
                  ).copyWith(color: AppColors.pureBlackColor),
                ),
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.greenColor,
                  labelColor: AppColors.greenColor,
                  unselectedLabelColor: AppColors.pureBlackColor,
                  splashBorderRadius: BorderRadius.circular(8),
                  dividerHeight: 0,
                  labelStyle: AppStyles.styleBold14(context),
                  unselectedLabelStyle: AppStyles.styleSemiBold12(context),
                  tabs:
                      tabs
                          .map(
                            (title) => Tab(
                              child: FittedBox(
                                child: Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children:
                  tabs.map((type) {
                    final String? selectedType = type == "الكل" ? null : type;
                    return BlocProvider(
                      create:
                          (context) =>
                              getIt<ActivitiesCubit>()
                                ..getActivites(type: selectedType),
                      child: ActivitiesGridViewSection(type: selectedType),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
