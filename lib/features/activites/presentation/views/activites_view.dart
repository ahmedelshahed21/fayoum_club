import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activites_grid_view_section.dart';
import 'package:flutter/material.dart';

class ActivitesView extends StatelessWidget {
  const ActivitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          VerticalSpace(16),
          Expanded(child: ActivitesGridViewSection()),
        ],
      ),
    );
  }
}
