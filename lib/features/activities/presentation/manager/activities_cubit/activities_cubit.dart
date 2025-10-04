import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';
import 'package:fayoum_club/features/activities/data/repos/activities_repo/activities_repo.dart';
import 'package:fayoum_club/features/activities/presentation/manager/activities_cubit/activities_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepo activites;

  ActivitiesCubit({required this.activites}) : super(const ActivitiesInitial());

  Future<void> getActivites({String? type}) async {
    emit(const ActivitiesLoading());

    final Either<Failure, ActivitiesModel> result = await activites
        .getActivites(type: type);

    result.fold(
      (failure) => emit(ActivitiesFailure(failure)),
      (bannersModel) => emit(ActivitiesSuccess(bannersModel)),
    );
  }
}
