import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/data/models/success_model.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';

abstract class PaymentProcessRepo {
  Future<Either<ValidationModel, BasicModel>> paymentProcess({required PaymentProcessRequestModel requestModel});
}
