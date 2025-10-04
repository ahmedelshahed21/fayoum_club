import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';
import 'package:fayoum_club/features/activities/presentation/widgets/activity_card.dart';
import 'package:fayoum_club/features/home/presentation/widgets/title_and_view_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/state_management/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class ActivitiesHorizontalListView extends StatelessWidget {
  const ActivitiesHorizontalListView({super.key, required this.activites});

  final List<ActivityItem> activites;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndViewAll(
          title: 'الأنشطة',
          onPressed:
              () => context.read<BottomNavigationBarCubit>().changeIndex(1),
        ),
        VerticalSpace(6),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: activites.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const HorizontalSpace(12),
            itemBuilder:
                (context, index) => AspectRatio(
                  aspectRatio: 0.85,
                  child: ActivityCard(activityItem: activites[index]),
                ),
          ),
        ),
      ],
    );
  }
}
