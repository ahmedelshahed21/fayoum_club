import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/utils/app_strings.dart';
import 'package:fayoum_club/core/utils/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/features/activites/data/models/activity_details_model/activity_details_model.dart';
import 'package:fayoum_club/features/activites/data/repos/activity_details_repo/activity_details_repo.dart';

class ActivityDetailsRepoImpl implements ActivityDetailsRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;

  ActivityDetailsRepoImpl({
    required this.dioConsumer,
    required this.networkCubit,
  });

  @override
  Future<Either<Failure, ActivityDetailsModel>> getActivityDetails({
    required int id,
  }) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(errMessage: AppStrings.noInternetConnection.tr()),
      );
    }

    try {
      final response = await dioConsumer.get(
        EndPoints.activityDetails(id),
      );

      // print(response);

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          final detailsModel = ActivityDetailsModel.fromJson(response);
          return Right(detailsModel);
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
      // print(e.toString());
      return Left(
        ServerFailure(errMessage: AppStrings.serverConnectionFailed.tr()),
      );
    }
  }
}
