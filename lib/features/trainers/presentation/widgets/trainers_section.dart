import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/trainers/presentation/widgets/trainer_tile.dart';
import 'package:flutter/material.dart';

class TrainersSection extends StatelessWidget {
  const TrainersSection({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {
    return detailsData.captans.isNotEmpty
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "المدربون",
          style: AppStyles.styleBold18(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
        const VerticalSpace(16),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: detailsData.captans.length,
            separatorBuilder: (_, __) => const HorizontalSpace(12),
            itemBuilder: (context, index) {
              return TrainerTile(trainer: detailsData.captans[index]);
            },
          ),
        ),
      ],
    )
        : SizedBox.shrink();
  }
}

