import 'package:fayoum_club/features/news/data/models/news_model.dart';

class UrgentNewsModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final List<NewsItem>? data;

  UrgentNewsModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    this.data,
  });

  factory UrgentNewsModel.fromJson(Map<String, dynamic> json) {
    return UrgentNewsModel(
      version: json['version'] ?? 0,
      code: json['code'] ?? 0,
      status: json['status'] ?? '',
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
          .map((e) => NewsItem.fromJson(e))
          .toList()
          : null,
    );
  }
}




