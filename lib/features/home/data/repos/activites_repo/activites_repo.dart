import 'package:fayoum_club/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/home/data/models/activites_models/activites_model.dart';

abstract class ActivitesRepo{
  Future<Either<Failure,ActivitesModel>> getActivites();
}