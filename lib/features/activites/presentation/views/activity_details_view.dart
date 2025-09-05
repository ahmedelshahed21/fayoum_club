import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_cubit.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_state.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activity_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fayoum_club/core/constants/app_colors.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pureWhiteColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ActivityDetailsCubit>()..getActivityDetails(id),
          child: BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
            builder: (context, state) {
              if (state is ActivityDetailsLoading) {
                return Skeletonizer(
                  containersColor: AppColors.loadingEffectColor,
                  textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(4)),
                  child: ActivityDetailsViewBody(
                    detailsData: getDummyActivityDetails(), // dummy
                  ),
                );
              } else if (state is ActivityDetailsSuccess) {
                return ActivityDetailsViewBody(
                  detailsData: state.activityDetailsModel.data!,
                );
              } else if (state is ActivityDetailsFailure) {
                return RetryWidget(
                  message: state.failure.errMessage,
                  onPressed: () => context
                      .read<ActivityDetailsCubit>()
                      .getActivityDetails(id),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
