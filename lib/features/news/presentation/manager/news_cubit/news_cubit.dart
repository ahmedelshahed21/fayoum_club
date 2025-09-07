import 'package:dartz/dartz.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/features/news/data/repos/news_repo/news_repo.dart';
import 'package:fayoum_club/features/news/presentation/manager/news_cubit/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepo newsRepo;

  NewsCubit({required this.newsRepo}) : super(const NewsInitial());

  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoading = false;
  final List<NewsItem> _items = [];

  Future<void> fetchNews({bool refresh = false, int? activityId,int? status,String? typeOption}) async {
    if (_isLoading) return;

    if (refresh) {
      _currentPage = 1;
      _hasMore = true;
      _items.clear();
    }

    if (!_hasMore) return;

    _isLoading = true;
    if (_currentPage == 1) emit(const NewsLoading());

    final Either<Failure, NewsModel> result =
    await newsRepo.getAllNews(page: _currentPage,activityId: activityId,status: status,typeOption: typeOption);

    result.fold(
          (failure) {
        emit(NewsFailure(failure));
      },
          (data) {
        _items.addAll(data.items);
        _hasMore = _currentPage < data.pagination.totalPages;

        emit(NewsSuccess(
          news: List.from(_items),
          hasMore: _hasMore,
        ));

        _currentPage++;
      },
    );

    _isLoading = false;
  }
}
