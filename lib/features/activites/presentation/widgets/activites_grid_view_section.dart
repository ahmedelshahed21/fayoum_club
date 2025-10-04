import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/widgets/app_indicators.dart';
import 'package:fayoum_club/core/widgets/empty_widget.dart';
import 'package:fayoum_club/core/widgets/retry_widget.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_cubit.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activites_cubit/activites_state.dart';
import 'package:fayoum_club/features/activites/presentation/widgets/activites_grid_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitesGridViewSection extends StatelessWidget {
  const ActivitesGridViewSection({super.key, this.type});

  final String? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: PrimaryRefreshIndicator(
        onRefresh: () async {
          context.read<ActivitesCubit>().getActivites(type: type);
        },
        child: BlocBuilder<ActivitesCubit, ActivitesState>(
          builder: (context, state) {
            if (state is ActivitesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ActivitesSuccess) {
              if (state.activitesModel.data.isEmpty) {
                return EmptyWidget(title: "لا يوجد أنشطة");
              }
              return ActivitesGridView(activites: state.activitesModel.data);
            } else if (state is ActivitesFailure) {
              return RetryWidget(
                message: state.failure.errMessage,
                onPressed: () {
                  context.read<ActivitesCubit>().getActivites(type: type);
                },
              );
            } else {
              return RetryWidget(
                message: AppStrings.unexpectedError.tr(),
                onPressed: () {
                  context.read<ActivitesCubit>().getActivites(type: type);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
