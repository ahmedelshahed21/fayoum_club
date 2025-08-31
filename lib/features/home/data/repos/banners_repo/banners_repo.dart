import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/errors/failure.dart';

abstract class BannersRepo {
  Future<Either<Failure, NewsModel>> getBanners();
}
