import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activity_details_header.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/trainers_section.dart';
import 'package:flutter/material.dart';

class ActivityDetailsViewBody extends StatelessWidget {
  const ActivityDetailsViewBody({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ActivityDetailsHeaderSection(image: detailsData.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detailsData.title, style: AppStyles.styleBold24(context)),
                const VerticalSpace(8),
                Text(
                  detailsData.description,
                  style: AppStyles.styleRegular16(context),
                ),
                const VerticalSpace(8),
                const Divider(),
                const VerticalSpace(16),
                TrainersSection(detailsData: detailsData)
              ],
            ),
          ),
        ],
      ),
    );
  }
}




