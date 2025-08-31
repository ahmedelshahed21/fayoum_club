import 'package:fayoum_club/features/news/data/models/news_model.dart';
import 'package:fayoum_club/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BannersState extends Equatable {
  const BannersState();

  @override
  List<Object?> get props => [];
}

class BannersInitial extends BannersState {
  const BannersInitial();
}

class BannersLoading extends BannersState {
  const BannersLoading();
}

class BannersSuccess extends BannersState {
  final NewsModel bannersModel;

  const BannersSuccess(this.bannersModel);

  @override
  List<Object?> get props => [bannersModel];
}

class BannersFailure extends BannersState {
  final Failure failure;

  const BannersFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
