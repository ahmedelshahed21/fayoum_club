import 'package:fayoum_club/core/data/models/activity_model.dart';
import 'package:fayoum_club/core/data/models/pagination_model.dart';


class NewsModel {
  final List<NewsItem> items;
  final Pagination pagination;

  NewsModel({
    required this.items,
    required this.pagination,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      items: (json['data']['items'] as List)
          .map((e) => NewsItem.fromJson(e))
          .toList(),
      pagination: Pagination.fromJson(json['data']['pagination']),
    );
  }
}

class NewsItem {
  final int id;
  final String title;
  final String description;
  final Activate? activate;
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
      id: json['id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      activate: json['activate'] != null
          ? Activate.fromJson(json['activate'])
          : null,
      status: json['status'],
      typeOption: json['typeOption'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

