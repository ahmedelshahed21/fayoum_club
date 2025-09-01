import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/profile/data/model/change_password_models/change_password_request_model.dart';
import '../../../../../../core/data/models/auth_failure_model.dart';
import '../../../../../../core/data/models/basic_model.dart';
abstract class ChangePasswordRepo {
  Future<Either<AuthFailureModel, BasicModel>> changePassword({
    required ChangePasswordRequestModel data

  });
}