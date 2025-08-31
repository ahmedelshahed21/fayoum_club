import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/home/data/models/activites_models/activites_model.dart';
import 'package:fayoum_club/features/home/data/repos/activites_repo/activites_repo.dart';
import 'package:fayoum_club/features/home/presentation/manager/activites_cubit/activites_state.dart';
import 'package:fayoum_club/features/home/presentation/manager/banners_cubit/banners_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitesCubit extends Cubit<ActivitesState> {
  final ActivitesRepo activites;

  ActivitesCubit({required this.activites}) : super(const ActivitesInitial());

  Future<void> getActivites() async {
    emit(const ActivitesLoading());

    final Either<Failure, ActivitesModel> result = await activites.getActivites();

    result.fold(
          (failure) => emit(ActivitesFailure(failure)),
          (bannersModel) => emit(ActivitesSuccess(bannersModel)),
    );
  }
}
