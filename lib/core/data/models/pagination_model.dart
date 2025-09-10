import 'package:fayoum_club/core/utils/end_points.dart';

class PaginationModel {
  final int total;
  final int currentPage;
  final int perPage;
  final int totalPages;

  PaginationModel({
    required this.total,
    required this.currentPage,
    required this.perPage,
    required this.totalPages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      total: json[ApiKey.total] as int,
      currentPage: json[ApiKey.currentPage] as int,
      perPage: json[ApiKey.perPage] as int,
      totalPages: json[ApiKey.totalPages] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.total: total,
      ApiKey.currentPage: currentPage,
      ApiKey.perPage: perPage,
      ApiKey.totalPages: totalPages,
    };
  }
}
