import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_request_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_success_model.dart';

abstract class ContactUsRepo {
  Future<Either<AuthFailureModel, ContactUSSuccessModel>> contactUs({
    required ContactUsRequestModel contactData,
  });
}
