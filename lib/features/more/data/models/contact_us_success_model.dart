import 'package:fayoum_club/core/utils/end_points.dart';

class ContactUSSuccessModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final ContactUSData data;

  ContactUSSuccessModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    required this.data,
  });

  factory ContactUSSuccessModel.fromJson(Map<String, dynamic> json) {
    return ContactUSSuccessModel(
      version: json[ApiKey.version] as int,
      code: json[ApiKey.code] as int,
      status: json[ApiKey.status] as String,
      message: json[ApiKey.message],
      data: ContactUSData.fromJson(json[ApiKey.data]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.version: version,
      ApiKey.code: code,
      ApiKey.status: status,
      ApiKey.message: message,
      ApiKey.data: data.toJson(),
    };
  }
}

class ContactUSData {
  final int id;
  final String details;
  final String name;
  final String phone;
  final String createdAt;
  final String updatedAt;

  ContactUSData({
    required this.id,
    required this.details,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContactUSData.fromJson(Map<String, dynamic> json) {
    return ContactUSData(
      id: json[ApiKey.id] as int,
      details: json[ApiKey.details] as String,
      name: json[ApiKey.name] as String,
      phone: json[ApiKey.phone] as String,
      createdAt: json[ApiKey.createdAt] as String,
      updatedAt: json[ApiKey.updatedAt] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.details: details,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.createdAt: createdAt,
      ApiKey.updatedAt: updatedAt,
    };
  }
}
