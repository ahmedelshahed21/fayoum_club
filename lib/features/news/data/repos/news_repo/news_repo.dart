import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';


abstract class NewsRepo {
  Future<Either<Failure, NewsModel>> getAllNews({int page = 1});
}
