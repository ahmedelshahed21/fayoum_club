import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/home/presentation/widgets/activites_grid_view_section.dart';
import 'package:flutter/material.dart';

class ActivitesView extends StatelessWidget{
  const ActivitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          VerticalSpace(24),
          Expanded(child: ActivitesGridViewSection()),
        ],
      ),
    );
  }
}