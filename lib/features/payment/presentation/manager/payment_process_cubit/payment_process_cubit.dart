import 'package:fayoum_club/core/data/models/success_model.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';
import 'package:fayoum_club/features/payment/data/repos/payment_process_repo/payment_process_repo.dart';
import 'package:fayoum_club/features/payment/presentation/manager/payment_process_cubit/payment_process_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';


class PaymentProcessCubit extends Cubit<PaymentProcessState> {
  final PaymentProcessRepo paymentProcessRepo;

  PaymentProcessCubit({required this.paymentProcessRepo}) : super(PaymentProcessInitial());

  Future<void> sendPaymentProcessData({required PaymentProcessRequestModel requestModel,}) async {
    emit(const PaymentProcessLoading());

    final Either<ValidationModel, BasicModel> result = await paymentProcessRepo.paymentProcess(requestModel: requestModel);

    result.fold(
          (failure) => emit(PaymentProcessFailure(failure)),
          (success) => emit(PaymentProcessSuccess(success)),
    );
  }
}
