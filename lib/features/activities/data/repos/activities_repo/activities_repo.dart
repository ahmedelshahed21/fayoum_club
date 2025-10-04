import 'package:fayoum_club/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';

abstract class ActivitiesRepo {
  Future<Either<Failure, ActivitiesModel>> getActivites({String? type});
}
