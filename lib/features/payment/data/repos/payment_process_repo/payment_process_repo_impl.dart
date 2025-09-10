import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/end_points.dart';
import 'package:fayoum_club/core/data/models/success_model.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/databases/cache/secure_storage_helper.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/features/payment/data/models/payment_process_request_model.dart';
import 'package:fayoum_club/features/payment/data/repos/payment_process_repo/payment_process_repo.dart';

class PaymentProcessRepoImpl implements PaymentProcessRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;
  final SecureStorageHelper secureStorageHelper;

  PaymentProcessRepoImpl({
    required this.dioConsumer,
    required this.networkCubit,
    required this.secureStorageHelper,
  });

  @override
  Future<Either<ValidationModel, BasicModel>> paymentProcess({
    required PaymentProcessRequestModel requestModel,
  }) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        ValidationModel(
          status: "error",
          message: AppStrings.serverConnectionFailed.tr(),
          errors: [AppStrings.serverConnectionFailed.tr()],
          code: -1,
        ),
      );
    }

    final token = await secureStorageHelper.getToken();
    try {
      final response = await dioConsumer.post(
        EndPoints.paymentProcess,
        data: requestModel.toJson(),
        headers: {Params.authorization: '${Params.bearer} $token'},
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          return Right(BasicModel.fromJson(response));
        } else {
          return Left(ValidationModel.fromJson(response));
        }
      } else {
        return Left(
          ValidationModel(
            status: "error",
            message: AppStrings.serverConnectionFailed.tr(),
            errors: [AppStrings.serverConnectionFailed.tr()],
            code: -1,
          ),
        );
      }
    } catch (e) {
      return Left(
        ValidationModel(
          status: "error",
          message: AppStrings.serverConnectionFailed.tr(),
          errors: [AppStrings.serverConnectionFailed.tr()],
          code: -1,
        ),
      );
    }
  }
}
