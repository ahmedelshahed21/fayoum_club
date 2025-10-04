import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/features/activities/data/models/activities_model/activities_model.dart';
import 'package:fayoum_club/features/activities/data/repos/activities_repo/activities_repo.dart';

class ActivitiesRepoImpl implements ActivitiesRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;

  ActivitiesRepoImpl({required this.dioConsumer, required this.networkCubit});
  @override
  Future<Either<Failure, ActivitiesModel>> getActivites({String? type}) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(errMessage: AppStrings.noInternetConnection.tr()),
      );
    }

    try {
      final response = await dioConsumer.get(
        EndPoints.activities,
        queryParameters: {Params.type: type},
      );

      // print(response);

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          final categoriesModel = ActivitiesModel.fromJson(response);
          return Right(categoriesModel);
        } else {
          return Left(
            ServerFailure(errMessage: AppStrings.serverConnectionFailed.tr()),
          );
        }
      } else {
        return Left(
          ServerFailure(errMessage: AppStrings.serverConnectionFailed.tr()),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(errMessage: AppStrings.serverConnectionFailed.tr()),
      );
    }
  }
}
