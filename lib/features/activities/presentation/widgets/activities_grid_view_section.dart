import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/empty_widget.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_state.dart';
import 'package:fayoum_club/features/activities/presentation/widgets/activities_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesGridViewSection extends StatelessWidget {
  const ActivitiesGridViewSection({super.key, this.type});

  final String? type;

  @override
  Widget build(BuildContext context) {
    return PrimaryRefreshIndicator(
      onRefresh: () async {
        context.read<ActivitiesCubit>().getActivites(type: type);
      },
      child: BlocBuilder<ActivitiesCubit, ActivitiesState>(
        builder: (context, state) {
          if (state is ActivitiesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ActivitiesSuccess) {
            if (state.activitesModel.data.isEmpty) {
              return EmptyWidget(title: AppStrings.noActivities.tr());
            }
            return ActivitiesGridView(activites: state.activitesModel.data);
          } else if (state is ActivitiesFailure) {
            return RetryWidget(
              message: state.failure.errMessage,
              onPressed: () {
                context.read<ActivitiesCubit>().getActivites(type: type);
              },
            );
          } else {
            return RetryWidget(
              message: AppStrings.unexpectedError.tr(),
              onPressed: () {
                context.read<ActivitiesCubit>().getActivites(type: type);
              },
            );
          }
        },
      ),
    );
  }
}
