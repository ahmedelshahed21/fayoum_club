import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/subscription_card.dart';
import 'package:flutter/material.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "قيمة الاشتراك",
          style: AppStyles.styleBold18(
            context,
          ).copyWith(color: AppColors.pureBlackColor),
        ),
        const HorizontalSpace(16),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SubscriptionCard(
                  title: "للأعضاء",
                  price: detailsData.monyMember.toString(),
                ),
              ),
              const HorizontalSpace(6),
              Expanded(
                child: SubscriptionCard(
                  title: "لغير الأعضاء",
                  price: detailsData.mony.toString(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

