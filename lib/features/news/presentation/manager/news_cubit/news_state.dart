import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {
  const NewsInitial();
}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsSuccess extends NewsState {
  final NewsModel news;

  const NewsSuccess(this.news);

  @override
  List<Object?> get props => [news];
}

class NewsFailure extends NewsState {
  final Failure failure;

  const NewsFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
