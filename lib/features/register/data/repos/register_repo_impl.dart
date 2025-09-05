import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/databases/cache/secure_storage_helper.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/core/data/models/validation_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:fayoum_club/features/register/data/models/register_data_model.dart';
import 'package:fayoum_club/features/register/data/repos/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterRepoImpl implements RegisterRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;
  final SecureStorageHelper secureStorageHelper;
  final UserDataManager userDataManager;

  RegisterRepoImpl({
    required this.dioConsumer,
    required this.networkCubit,
    required this.secureStorageHelper,
    required this.userDataManager,
  });

  @override
  Future<Either<ValidationModel, AuthSuccessModel>> register({
    required RegisterDataModel registerData,
  }) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        ValidationModel(
          status: "error",
          message: AppStrings.noInternetConnection.tr(),
          errors: [AppStrings.noInternetConnection.tr()],
          code: 0,
        ),
      );
    }

    try {
      final response = await dioConsumer.post(
        EndPoints.register,
        data: registerData.toJson(),
      );
      print(response);
      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] >= 200 && response[ApiKey.code] < 400) {
          final registerSuccessModel = AuthSuccessModel.fromJson(response);

          await secureStorageHelper.saveToken(
            token: response[ApiKey.data][ApiKey.accessToken],
          );

          userDataManager.saveUserName(name: response[ApiKey.data][ApiKey.name]);
          userDataManager.saveUserPhoneNumber(phoneNumber: response[ApiKey.data][ApiKey.phone]);
          userDataManager.saveUserEmail(email: response[ApiKey.data][ApiKey.email]);
          userDataManager.saveUserGender(gender: response[ApiKey.data][ApiKey.gender],);
          response[ApiKey.data][ApiKey.code] == null
              ? null
              : userDataManager.saveUserMembership(
              membershipCode: response[ApiKey.data][ApiKey.code]);


          return Right(registerSuccessModel);
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
          message: AppStrings.unexpectedError.tr(),
          errors: [AppStrings.unexpectedError.tr()],
          code: -2,
        ),
      );
    }
  }
}
