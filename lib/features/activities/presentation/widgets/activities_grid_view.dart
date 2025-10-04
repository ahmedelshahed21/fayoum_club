import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';
import 'package:fayoum_club/features/activities/presentation/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivitiesGridView extends StatelessWidget {
  const ActivitiesGridView({super.key, required this.activites});

  final List<ActivityItem> activites;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 16,
        mainAxisSpacing: 32,
      ),
      itemCount: activites.length,
      itemBuilder: (context, index) {
        return ActivityCard(activityItem: activites[index]);
      },
    );
  }
}
