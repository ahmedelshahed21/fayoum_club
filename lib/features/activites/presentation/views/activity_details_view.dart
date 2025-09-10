import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_cubit.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_state.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activity_details_view_body.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivityDetailsView extends StatefulWidget {
  const ActivityDetailsView({super.key, required this.id});

  final int id;

  @override
  State<ActivityDetailsView> createState() => _ActivityDetailsViewState();
}

class _ActivityDetailsViewState extends State<ActivityDetailsView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<NewsCubit>().fetchNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    getIt<ActivityDetailsCubit>()
                      ..getActivityDetails(widget.id),
          ),
          BlocProvider(
            create:
                (context) =>
                    getIt<NewsCubit>()..fetchNews(activityId: widget.id),
          ),
        ],

        child: BlocBuilder<ActivityDetailsCubit, ActivityDetailsState>(
          builder: (context, state) {
            if (state is ActivityDetailsLoading) {
              return Skeletonizer(
                containersColor: AppColors.loadingEffectColor,
                textBoneBorderRadius: TextBoneBorderRadius(
                  BorderRadius.circular(2),
                ),
                child: ActivityDetailsViewBody(
                  scrollController: _scrollController,
                  activityDetailsData: getDummyActivityDetails(), // dummy
                ),
              );
            } else if (state is ActivityDetailsSuccess) {
              return ActivityDetailsViewBody(
                scrollController: _scrollController,
                activityDetailsData: state.activityDetailsModel.data!,
              );
            } else if (state is ActivityDetailsFailure) {
              return RetryWidget(
                message: state.failure.errMessage,
                onPressed:
                    () => context
                        .read<ActivityDetailsCubit>()
                        .getActivityDetails(widget.id),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
