import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_request_model.dart';
import 'package:fayoum_club/features/more/data/models/contact_us_success_model.dart';

abstract class ContactUsRepo {
  Future<Either<ValidationModel, ContactUSSuccessModel>> contactUs({
    required ContactUsRequestModel contactData,
  });
}
