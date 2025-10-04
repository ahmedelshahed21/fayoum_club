import 'package:fayoum_club/core/utils/end_points.dart';

class ActivitiesModel {
  final int? version;
  final int? code;
  final String? status;
  final String? message;
  final List<ActivityItem> data;

  ActivitiesModel({
    this.version,
    this.code,
    this.status,
    this.message,
    required this.data,
  });

  factory ActivitiesModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesModel(
      version: json[ApiKey.version] as int?,
      code: json[ApiKey.code] as int?,
      status: json[ApiKey.status] as String?,
      message: json[ApiKey.message] as String?,
      data:
          (json[ApiKey.data] as List<dynamic>?)
              ?.map((e) => ActivityItem.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ActivityItem {
  final int? id;
  final String? title;
  final String? description;
  final String? type;
  final String? image;
  final int? monyMember;
  final int? mony;
  final String? createdAt;
  final String? updatedAt;

  ActivityItem({
    this.id,
    this.title,
    this.description,
    this.type,
    this.image,
    this.monyMember,
    this.mony,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityItem.fromJson(Map<String, dynamic> json) {
    return ActivityItem(
      id: json[ApiKey.id] as int?,
      title: json[ApiKey.title] as String?,
      description: json[ApiKey.description] as String?,
      type: json[ApiKey.type] as String?,
      image: json[ApiKey.image] as String?,
      monyMember: json[ApiKey.moneyMember] as int?,
      mony: json[ApiKey.money] as int?,
      createdAt: json[ApiKey.createdAt] as String?,
      updatedAt: json[ApiKey.updatedAt] as String?,
    );
  }
}
