import '../../../../../core/data/models/pagination_model.dart';

class ActivitesModel {
  final int? version;
  final int? code;
  final String? status;
  final String? message;
  final ActivitiesData? data;

  ActivitesModel({
    this.version,
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory ActivitesModel.fromJson(Map<String, dynamic> json) {
    return ActivitesModel(
      version: json['version'] as int?,
      code: json['code'] as int?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? ActivitiesData.fromJson(json['data']) : null,
    );
  }
}

class ActivitiesData {
  final List<ActivityItem> items;
  final Pagination? pagination;

  ActivitiesData({required this.items, this.pagination});

  factory ActivitiesData.fromJson(Map<String, dynamic> json) {
    return ActivitiesData(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => ActivityItem.fromJson(e))
              .toList() ??
          [], // 👈 هنا لو فاضي هيرجع ليست فاضية
      pagination:
          json['pagination'] != null
              ? Pagination.fromJson(json['pagination'])
              : null,
    );
  }
}

class ActivityItem {
  final int? id;
  final String? title;
  final String? description;
  final String? type;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  ActivityItem({
    this.id,
    this.title,
    this.description,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityItem.fromJson(Map<String, dynamic> json) {
    return ActivityItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}
