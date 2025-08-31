import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';


abstract class LoginRepo {
  Future<Either<AuthFailureModel, AuthSuccessModel>> login(
      {required String phoneNumber, required String password});
}
