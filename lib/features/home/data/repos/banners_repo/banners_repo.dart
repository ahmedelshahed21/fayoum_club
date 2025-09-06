import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/home/data/models/banners_models/urgent_news_model.dart';


abstract class BannersRepo {
  Future<Either<Failure, UrgentNewsModel>> getBanners();
}
