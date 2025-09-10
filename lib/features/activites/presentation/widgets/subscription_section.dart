import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_styles.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/price_widget.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionSection extends StatelessWidget {
  const SubscriptionSection({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {
    final UserDataManager userData = getIt<UserDataManager>();
    final bool isGuest = context.select<UserSessionCubit, bool>(
      (cubit) => cubit.state.isGuest,
    );
    return userData.getUserMembership() == null || isGuest
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "قيمة الاشتراك",
              style: AppStyles.styleSemiBold16(
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
                      price: detailsData.moneyMember.toString(),
                    ),
                  ),
                  const HorizontalSpace(6),
                  Expanded(
                    child: SubscriptionCard(
                      title: "لغير الأعضاء",
                      price: detailsData.money.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
        : Row(
          children: [
            Text(
              "قيمة الاشتراك",
              style: AppStyles.styleSemiBold16(
                context,
              ).copyWith(color: AppColors.pureBlackColor),
            ),
            const Spacer(),
            PriceWidget(
              price: detailsData.moneyMember.toString(),
              currency: 'ج.م',
            ),
            const HorizontalSpace(16),
          ],
        );
  }
}
