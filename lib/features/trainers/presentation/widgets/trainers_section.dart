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
            const VerticalSpace(4),
            Column(
              children:
                  detailsData.captans
                      .map((trainer) => TrainerTile(trainer: trainer))
                      .toList(),
            ),
          ],
        )
        : Text(
          "لا يوجد مدربين متاحين",
          style: AppStyles.styleRegular16(context),
        );
  }
}
