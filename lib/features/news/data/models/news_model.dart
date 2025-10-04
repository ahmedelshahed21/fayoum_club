import 'package:fayoum_club/core/data/models/activity_model.dart';
import 'package:fayoum_club/core/data/models/pagination_model.dart';
import 'package:fayoum_club/core/utils/end_points.dart';

class NewsModel {
  final List<NewsItem> items;
  final PaginationModel pagination;

  NewsModel({required this.items, required this.pagination});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      items: (json[ApiKey.data][ApiKey.items] as List)
          .map((e) => NewsItem.fromJson(e))
          .toList(),
      pagination: PaginationModel.fromJson(
        json[ApiKey.data][ApiKey.pagination],
      ),
    );
  }
}

class NewsItem {
  final int id;
  final String title;
  final String description;
  final ActivityModel? activate;
  final int status;
  final String typeOption;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsItem({
    required this.id,
    required this.title,
    required this.description,
    required this.activate,
    required this.status,
    required this.typeOption,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json[ApiKey.id],
      title: json[ApiKey.title] ?? '',
      description: json[ApiKey.description] ?? '',
      activate: json[ApiKey.activityId] != null
          ? ActivityModel.fromJson(json[ApiKey.activityId])
          : null,
      status: json[ApiKey.status],
      typeOption: json[ApiKey.typeOption] ?? '',
      image: json[ApiKey.image] ?? '',
      createdAt: DateTime.parse(json[ApiKey.createdAt]),
      updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
    );
  }
}
