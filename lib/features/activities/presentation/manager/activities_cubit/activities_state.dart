import 'package:fayoum_club/core/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';

abstract class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object?> get props => [];
}

class ActivitiesInitial extends ActivitiesState {
  const ActivitiesInitial();
}

class ActivitiesLoading extends ActivitiesState {
  const ActivitiesLoading();
}

class ActivitiesSuccess extends ActivitiesState {
  final ActivitiesModel activitesModel;

  const ActivitiesSuccess(this.activitesModel);

  @override
  List<Object?> get props => [activitesModel];
}

class ActivitiesFailure extends ActivitiesState {
  final Failure failure;

  const ActivitiesFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
