import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/activities/data/models/activity_details_model/activity_details_model.dart';

abstract class ActivityDetailsRepo {
  Future<Either<Failure, ActivityDetailsModel>> getActivityDetails({
    required int id,
  });
}
