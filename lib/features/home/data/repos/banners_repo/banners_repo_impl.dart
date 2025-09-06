import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/features/home/data/models/banners_models/urgent_news_model.dart';
import 'package:fayoum_club/features/home/data/repos/banners_repo/banners_repo.dart';


class BannersRepoImpl implements BannersRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;

  BannersRepoImpl({required this.dioConsumer, required this.networkCubit});

  @override
  Future<Either<Failure, UrgentNewsModel>> getBanners() async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(errMessage: AppStrings.noInternetConnection.tr()),
      );
    }

    try {
      final response = await dioConsumer.get(
        EndPoints.banners,
        queryParameters: {Params.status: 1},
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          final news = UrgentNewsModel.fromJson(response);
          return Right(news);
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
        UnexpectedFailure(errMessage: AppStrings.unexpectedError.tr()),
      );
    }
  }
}
