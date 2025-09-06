import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';

abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsFailure extends NewsState {
  final Failure failure;
  const NewsFailure(this.failure);
}

class NewsSuccess extends NewsState {
  final List<NewsItem> news;
  final bool hasMore;
  const NewsSuccess({required this.news, required this.hasMore});
}
