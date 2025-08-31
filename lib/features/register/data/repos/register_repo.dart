import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:fayoum_club/features/register/data/models/register_data_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<AuthFailureModel, AuthSuccessModel>> register({
    required RegisterDataModel registerData,
  });
}
