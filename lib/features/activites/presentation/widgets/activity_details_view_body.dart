import 'package:cached_network_image/cached_network_image.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/constants/app_constants.dart';
import 'package:fayoum_club/core/constants/app_styles.dart';
import 'package:fayoum_club/core/functions/show_login_is_required_dialog.dart';
import 'package:fayoum_club/core/routes/app_router.dart';
import 'package:fayoum_club/core/state_management/user_cubit/user_session_cubit.dart';
import 'package:fayoum_club/core/widgets/app_buttons.dart';
import 'package:fayoum_club/core/widgets/back_icon_button.dart';
import 'package:fayoum_club/core/widgets/image_loading_effect.dart';
import 'package:fayoum_club/core/widgets/spacing.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/subscription_section.dart';
import 'package:fayoum_club/features/trainers/presentation/widgets/trainers_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActivityDetailsViewBody extends StatelessWidget {
  const ActivityDetailsViewBody({super.key, required this.detailsData});

  final ActivityDetailsData detailsData;

  @override
  Widget build(BuildContext context) {

    final bool isGuest = context.select<UserSessionCubit, bool>(
          (cubit) => cubit.state.isGuest,
    );
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              /// SliverAppBar لعرض صورة النشاط
              SliverAppBar(
                expandedHeight: 220,
                pinned: true,
                centerTitle: true,
                title: Text(
                  detailsData.title,
                  style: AppStyles.styleSemiBold18(
                    context,
                  ).copyWith(color: AppColors.pureWhiteColor),
                ),
                backgroundColor: AppColors.primaryColor,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BackIconButton(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: detailsData.image ?? AppConstants.noImageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ImageLoadingEffect(),
                    errorWidget:
                        (context, url, error) => Container(
                      color: Colors.grey.shade300,
                      width: double.infinity,
                      height: 220,
                      child: const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                ),
              ),

              /// باقي المحتوى
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpace(8),
                      Text(
                        detailsData.description ?? '',
                        style: AppStyles.styleRegular16(context),
                      ),
                      const VerticalSpace(24),
                      SubscriptionSection(detailsData: detailsData),
                      const VerticalSpace(24),
                      TrainersSection(detailsData: detailsData),
                      const VerticalSpace(80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// bottomNavigationBar
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              backgroundColor: AppColors.blueColor,
              onPressed: () {
                isGuest
                    ? showLoginIsRequiredDialog(context)
                    : GoRouter.of(context).go(
                  AppRouter.payMobView,
                  extra: detailsData,
                );
              },
              text: 'الاشتراك',
            ),
          ),
        ),
      ],
    );
  }
}
