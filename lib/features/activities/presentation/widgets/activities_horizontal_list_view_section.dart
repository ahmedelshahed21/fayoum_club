import 'package:fayoum_club/core/utils/app_colors.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_state.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/activities/presentation/widgets/activites_horizontal_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivitiesHorizontalListViewSection extends StatelessWidget {
  const ActivitiesHorizontalListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        if (state is ActivitiesLoading) {
          return Skeletonizer(
            containersColor: AppColors.loadingEffectColor,
            textBoneBorderRadius: TextBoneBorderRadius(
              BorderRadius.circular(4),
            ),
            child: ActivitiesHorizontalListView(
              activites: getDummyActivitiesList(),
            ),
          );
        } else if (state is ActivitiesSuccess) {
          return ActivitiesHorizontalListView(
            activites: state.activitesModel.data.take(8).toList(),
          );
        } else if (state is ActivitiesFailure) {
          return RetryWidget(
            message: state.failure.errMessage,
            onPressed: () {
              context.read<BannersCubit>().getBanners();
              context.read<ActivitiesCubit>().getActivites();
              context.read<NewsCubit>().fetchNews(refresh: true);
            },
          );
        } else {
          return RetryWidget(
            message: AppStrings.unexpectedError.tr(),
            onPressed: () {
              context.read<ActivitiesCubit>().getActivites();
            },
          );
        }
      },
    );
  }
}
