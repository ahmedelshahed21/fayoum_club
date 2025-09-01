import 'package:equatable/equatable.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';

abstract class ActivityDetailsState extends Equatable {
  const ActivityDetailsState();

  @override
  List<Object?> get props => [];
}

class ActivityDetailsInitial extends ActivityDetailsState {
  const ActivityDetailsInitial();
}

class ActivityDetailsLoading extends ActivityDetailsState {
  const ActivityDetailsLoading();
}

class ActivityDetailsSuccess extends ActivityDetailsState {
  final ActivityDetailsModel activityDetailsModel;

  const ActivityDetailsSuccess(this.activityDetailsModel);

  @override
  List<Object?> get props => [activityDetailsModel];
}

class ActivityDetailsFailure extends ActivityDetailsState {
  final Failure failure;

  const ActivityDetailsFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
