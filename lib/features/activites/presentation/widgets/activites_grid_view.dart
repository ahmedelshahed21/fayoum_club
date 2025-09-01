import 'package:fayoum_club/features/activites/data/models/activites_model/activites_model.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activity_card.dart';
import 'package:flutter/material.dart';

class ActivitesGridView extends StatelessWidget {
  const ActivitesGridView({super.key, required this.activites});

  final List<ActivityItem> activites;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
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
