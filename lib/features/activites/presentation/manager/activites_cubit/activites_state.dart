import 'package:fayoum_club/core/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:fayoum_club/features/activites/data/models/activites_model/activites_model.dart';

abstract class ActivitesState extends Equatable {
  const ActivitesState();

  @override
  List<Object?> get props => [];
}

class ActivitesInitial extends ActivitesState {
  const ActivitesInitial();
}

class ActivitesLoading extends ActivitesState {
  const ActivitesLoading();
}

class ActivitesSuccess extends ActivitesState {
  final ActivitesModel activitesModel;

  const ActivitesSuccess(this.activitesModel);

  @override
  List<Object?> get props => [activitesModel];
}

class ActivitesFailure extends ActivitesState {
  final Failure failure;

  const ActivitesFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
