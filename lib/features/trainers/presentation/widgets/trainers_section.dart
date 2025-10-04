import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activities/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/trainers/presentation/widgets/trainer_tile.dart';
import 'package:flutter/material.dart';

class TrainersSection extends StatelessWidget {
  const TrainersSection({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {
    return detailsData.captains.isNotEmpty
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "المدربون",
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.pureBlackColor),
            ),
            const VerticalSpace(12),
            SizedBox(
              height: 128,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: detailsData.captains.length,
                separatorBuilder: (_, __) => const HorizontalSpace(12),
                itemBuilder: (context, index) {
                  return TrainerTile(trainer: detailsData.captains[index]);
                },
              ),
            ),
          ],
        )
        : SizedBox.shrink();
  }
}
