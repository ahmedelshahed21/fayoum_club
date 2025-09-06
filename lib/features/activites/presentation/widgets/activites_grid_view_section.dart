import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_state.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activites_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitesGridViewSection extends StatelessWidget {
  const ActivitesGridViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryRefreshIndicator(
      onRefresh: () async {
        context.read<ActivitesCubit>().getActivites();
      },
      child: BlocBuilder<ActivitesCubit, ActivitesState>(
        builder: (context, state) {
          if (state is ActivitesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ActivitesSuccess) {
            return Stack(
              children: [
                ActivitesGridView(activites: state.activitesModel.data),
              ],
            );
          } else if (state is ActivitesFailure) {
            return RetryWidget(
              message: state.failure.errMessage,
              onPressed: () {
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
        },
      ),
    );
  }
}
