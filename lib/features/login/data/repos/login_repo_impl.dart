import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/databases/cache/secure_storage_helper.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/data/models/auth_success_model.dart';
import 'package:fayoum_club/features/login/data/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;
  final SecureStorageHelper secureStorageHelper;
  final UserDataManager userDataManager;
  final NetworkConnectionCubit networkCubit;

  LoginRepoImpl({
    required this.dioConsumer,
    required this.secureStorageHelper,
    required this.userDataManager,
    required this.networkCubit,
  });

  @override
  Future<Either<AuthFailureModel, AuthSuccessModel>> login({
    required String phoneNumber,
    required String password,
  }) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        AuthFailureModel(
          status: "error",
          message: AppStrings.noInternetConnection.tr(),
          errors: [AppStrings.noInternetConnection.tr()],
          code: 0,
        ),
      );
    }

    try {
      final response = await dioConsumer.post(
        EndPoints.login,
        data: {
          ApiKey.phoneNumber: phoneNumber,
          ApiKey.password: password,
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] >= 200 && response[ApiKey.code] < 400) {
          final loginSuccessModel = AuthSuccessModel.fromJson(response);

          await secureStorageHelper.saveToken(
            token: response[ApiKey.data][ApiKey.accessToken],
          );
          userDataManager.saveUserName(name: response[ApiKey.data][ApiKey.name]);
          userDataManager.saveUserPhoneNumber(phoneNumber: response[ApiKey.data][ApiKey.phone]);
          userDataManager.saveUserEmail(email: response[ApiKey.data][ApiKey.email]);



          return Right(loginSuccessModel);
        } else {
          return Left(AuthFailureModel.fromJson(response));
        }
      } else {
        return Left(
          AuthFailureModel(
            status: "error",
            message: AppStrings.serverConnectionFailed.tr(),
            errors: [AppStrings.serverConnectionFailed.tr()],
            code: -1,
          ),
        );
      }
    } catch (e) {
      return Left(
        AuthFailureModel(
          status: "error",
          message: AppStrings.unexpectedError.tr(),
          errors: [AppStrings.unexpectedError.tr()],
          code: -2,
        ),
      );
    }
  }
}
