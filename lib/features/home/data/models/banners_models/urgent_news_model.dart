import 'package:fayoum_club/core/utils/end_points.dart';
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
      version: json[ApiKey.version] ?? 0,
      code: json[ApiKey.code] ?? 0,
      status: json[ApiKey.status] ?? '',
      message: json[ApiKey.message],
      data: json[ApiKey.data] != null
          ? (json[ApiKey.data] as List)
          .map((e) => NewsItem.fromJson(e))
          .toList()
          : null,
    );
  }
}