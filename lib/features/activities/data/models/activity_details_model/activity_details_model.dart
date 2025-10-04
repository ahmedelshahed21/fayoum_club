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
      data: json[ApiKey.data] != null
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
      captains: (json[ApiKey.captains] as List<dynamic>?)
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
  final List<CaptainTimeModel> time;

  CaptainModel({
    required this.id,
    required this.name,
    this.description,
    required this.activateId,
    required this.isActive,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.time,
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
      time: (json[ApiKey.time] as List<dynamic>?)
          ?.map((e) => CaptainTimeModel.fromJson(e))
          .toList() ??
          [],
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
      ApiKey.time: time.map((e) => e.toJson()).toList(),
    };
  }
}

class CaptainTimeModel {
  final int id;
  final int captainId;
  final String day;
  final String fromTime;
  final String toTime;
  final String status;
  final String? note;
  final String createdAt;
  final String updatedAt;

  CaptainTimeModel({
    required this.id,
    required this.captainId,
    required this.day,
    required this.fromTime,
    required this.toTime,
    required this.status,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CaptainTimeModel.fromJson(Map<String, dynamic> json) {
    return CaptainTimeModel(
      id: json[ApiKey.id] ?? 0,
      captainId: json[ApiKey.captainId] ?? 0,
      day: json[ApiKey.day] ?? '',
      fromTime: json[ApiKey.fromTime] ?? '',
      toTime: json[ApiKey.toTime] ?? '',
      status: json[ApiKey.status] ?? '',
      note: json[ApiKey.note],
      createdAt: json[ApiKey.createdAt] ?? '',
      updatedAt: json[ApiKey.updatedAt] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.captainId: captainId,
      ApiKey.day: day,
      ApiKey.fromTime: fromTime,
      ApiKey.toTime: toTime,
      ApiKey.status: status,
      ApiKey.note: note,
      ApiKey.createdAt: createdAt,
      ApiKey.updatedAt: updatedAt,
    };
  }
}
