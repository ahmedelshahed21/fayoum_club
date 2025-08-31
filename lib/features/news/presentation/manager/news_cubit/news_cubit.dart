import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fayoum_club/features/news/data/repos/news_repo/news_repo.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo news;

  NewsCubit({required this.news}) : super(const NewsInitial());

  Future<void> getAllNews() async {
    emit(const NewsLoading());

    final Either<Failure, NewsModel> result = await news.getAllNews();

    result.fold(
          (failure) => emit(NewsFailure(failure)),
          (bannersModel) => emit(NewsSuccess(bannersModel)),
    );
  }
}
