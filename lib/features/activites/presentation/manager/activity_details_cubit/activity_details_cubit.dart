import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/data/repos/activity_details_repo/activity_details_repo.dart';
import 'package:fayoum_club/features/activites/presentation/manager/activity_details_cubit/activity_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fayoum_club/core/errors/failure.dart';


class ActivityDetailsCubit extends Cubit<ActivityDetailsState> {
  final ActivityDetailsRepo activityDetailsRepo;

  ActivityDetailsCubit({required this.activityDetailsRepo})
      : super(const ActivityDetailsInitial());

  Future<void> getActivityDetails(int id) async {
    emit(const ActivityDetailsLoading());

    final Either<Failure, ActivityDetailsModel> result =
    await activityDetailsRepo.getActivityDetails(id: id);

    result.fold(
          (failure) => emit(ActivityDetailsFailure(failure)),
          (detailsModel) => emit(ActivityDetailsSuccess(detailsModel)),
    );
  }
}
