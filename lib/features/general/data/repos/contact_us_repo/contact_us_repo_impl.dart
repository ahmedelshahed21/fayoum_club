import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/data/models/auth_failure_model.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/databases/cache/secure_storage_helper.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/features/general/data/models/contact_us_request_model.dart';
import 'package:fayoum_club/features/general/data/models/contact_us_success_model.dart';
import 'package:fayoum_club/features/general/data/repos/contact_us_repo/contact_us_repo.dart';


class ContactUsRepoImpl implements ContactUsRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;
  final SecureStorageHelper secureStorageHelper;

  ContactUsRepoImpl({
    required this.dioConsumer,
    required this.networkCubit,
    required this.secureStorageHelper,
  });

  @override
  Future<Either<AuthFailureModel, ContactUSSuccessModel>> contactUs(
      {required ContactUsRequestModel contactData}) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        AuthFailureModel(
          status: "error",
          message: AppStrings.serverConnectionFailed.tr(),
          errors: [AppStrings.serverConnectionFailed.tr()],
          code: -1,
        ),
      );
    }

    try {
      final response = await dioConsumer.post(
        EndPoints.contactUs,
        data: contactData.toJson(),
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          return Right(ContactUSSuccessModel.fromJson(response));
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
          message: AppStrings.serverConnectionFailed.tr(),
          errors: [AppStrings.serverConnectionFailed.tr()],
          code: -1,
        ),
      );
    }
  }
}
