import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/functions/dummy_lists.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/home/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/home/presentation/manager/activites_cubit/activites_state.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_cubit.dart';
import 'package:fayoum_club/features/home/presentation/widgets/activites_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ActivitesHorizontalListViewSection extends StatelessWidget {
  const ActivitesHorizontalListViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitesCubit, ActivitesState>(
        builder: (context, state) {
      if (state is ActivitesLoading) {
        return Skeletonizer(
          textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(4)),
            child: ActivitesListView(activites: getDummyActivitiesList()));
      } else if (state is ActivitesSuccess) {
        return ActivitesListView(activites: state.activitesModel.data!.items.take(8).toList());
      } else if (state is ActivitesFailure) {
        return RetryWidget(
          message: state.failure.errMessage,
          onPressed: () {
            context.read<BannersCubit>().getBanners();
            context.read<ActivitesCubit>().getActivites();
          },
        );
      } else {
        return RetryWidget(
          message: AppStrings.unexpectedError.tr(),
          onPressed: () {
            context.read<ActivitesCubit>().getActivites();
          },
        );
      }
    });
  }
}
