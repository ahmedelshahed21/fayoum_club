import 'package:fayoum_club/core/utils/end_points.dart';

class ActivityDetailsModel {
  final int version;
  final int code;
  final String? status;
  final String? message;
  final ActivityDetailsData? data;

  ActivityDetailsModel({
    required this.version,
    required this.code,
    this.status,
    this.message,
    this.data,
  });

  factory ActivityDetailsModel.fromJson(Map<String, dynamic> json) {
    return ActivityDetailsModel(
      version: json[ApiKey.version] ?? 0,
      code: json[ApiKey.code] ?? 0,
      status: json[ApiKey.status],
      message: json[ApiKey.message],
      data:
          json[ApiKey.data] != null
              ? ActivityDetailsData.fromJson(json[ApiKey.data])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.version: version,
      ApiKey.code: code,
      ApiKey.status: status,
      ApiKey.message: message,
      ApiKey.data: data?.toJson(),
    };
  }
}

class ActivityDetailsData {
  final int id;
  final String? description;
  final String? type;
  final String? image;
  final String title;
  final int moneyMember;
  final int money;
  final String createdAt;
  final String updatedAt;
  final List<CaptainModel> captains;

  ActivityDetailsData({
    required this.id,
    this.description,
    this.type,
    this.image,
    required this.title,
    required this.moneyMember,
    required this.money,
    required this.createdAt,
    required this.updatedAt,
    required this.captains,
  });

  factory ActivityDetailsData.fromJson(Map<String, dynamic> json) {
    return ActivityDetailsData(
      id: json[ApiKey.id] ?? 0,
      description: json[ApiKey.description],
      type: json[ApiKey.type],
      image: json[ApiKey.image],
      title: json[ApiKey.title] ?? '',
      moneyMember: json[ApiKey.moneyMember] ?? 0,
      money: json[ApiKey.money] ?? 0,
      createdAt: json[ApiKey.createdAt] ?? '',
      updatedAt: json[ApiKey.updatedAt] ?? '',
      captains:
          (json[ApiKey.captains] as List<dynamic>?)
              ?.map((e) => CaptainModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.description: description,
      ApiKey.type: type,
      ApiKey.image: image,
      ApiKey.title: title,
      ApiKey.moneyMember: moneyMember,
      ApiKey.money: money,
      ApiKey.createdAt: createdAt,
      ApiKey.updatedAt: updatedAt,
      ApiKey.captains: captains.map((e) => e.toJson()).toList(),
    };
  }
}

class CaptainModel {
  final int id;
  final String name;
  final String? description;
  final int activateId;
  final int isActive;
  final String? image;
  final String createdAt;
  final String updatedAt;

  CaptainModel({
    required this.id,
    required this.name,
    this.description,
    required this.activateId,
    required this.isActive,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CaptainModel.fromJson(Map<String, dynamic> json) {
    return CaptainModel(
      id: json[ApiKey.id] ?? 0,
      name: json[ApiKey.name] ?? '',
      description: json[ApiKey.description],
      activateId: json[ApiKey.activityId] ?? 0,
      isActive: json[ApiKey.isActive] ?? 0,
      image: json[ApiKey.image],
      createdAt: json[ApiKey.createdAt] ?? '',
      updatedAt: json[ApiKey.updatedAt] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.name: name,
      ApiKey.description: description,
      ApiKey.activityId: activateId,
      ApiKey.isActive: isActive,
      ApiKey.image: image,
      ApiKey.createdAt: createdAt,
      ApiKey.updatedAt: updatedAt,
    };
  }
}
