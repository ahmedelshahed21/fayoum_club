import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fayoum_club/core/constants/app_strings.dart';
import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/databases/api/dio_consumer.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/core/state_management/network_connection_cubit/network_connection_cubit.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/data/repos/news_repo/news_repo.dart';

class NewsRepoImpl implements NewsRepo {
  final DioConsumer dioConsumer;
  final NetworkConnectionCubit networkCubit;

  NewsRepoImpl({required this.dioConsumer, required this.networkCubit});

  @override
  Future<Either<Failure, NewsModel>> getAllNews({int page = 1,int? activityId,int? status,String? typeOption}) async {
    final isConnected = await networkCubit.networkInfo.isConnected;

    if (!isConnected) {
      return Left(
        NoInternetFailure(errMessage: AppStrings.noInternetConnection.tr()),
      );
    }

    try {
      final response = await dioConsumer.get(EndPoints.news,
          queryParameters: {
            Params.page:page,
            'perPage':3,
            'activateId': activityId,
            'status': status,
            'typeOption':typeOption
          }
      );

      if (response != null && response is Map<String, dynamic>) {
        if (response[ApiKey.code] == 200) {
          final news = NewsModel.fromJson(response);
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
