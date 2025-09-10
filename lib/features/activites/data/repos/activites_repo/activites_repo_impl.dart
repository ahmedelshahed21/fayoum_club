import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/features/activites/data/models/activites_model/activites_model.dart';
import 'package:fayoum_club/features/activites/data/repos/activites_repo/activites_repo.dart';

class ActivitesRepoImpl implements ActivitesRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;

  ActivitesRepoImpl({required this.dioConsumer, required this.networkCubit});
  @override
  Future<Either<Failure, ActivitesModel>> getActivites() async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(errMessage: AppStrings.noInternetConnection.tr()),
      );
    }

    try {
      final response = await dioConsumer.get(EndPoints.activities);

      print(response);

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          final categoriesModel = ActivitesModel.fromJson(response);
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
