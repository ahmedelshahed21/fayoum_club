import 'package:fayoum_club/core/constants/end_points.dart';

class BasicModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final dynamic data;

  BasicModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    this.data,
  });

  factory BasicModel.fromJson(Map<String, dynamic> json) {
    return BasicModel(
      version: json['version'] as int,
      code: json[ ApiKey.code] as int,
      status: json[ ApiKey.status] as String,
      message: json[ ApiKey.message] as String?,
      data: json[ApiKey.data],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      ApiKey.code: code,
      ApiKey.status: status,
      ApiKey.message: message,
      ApiKey.data: data,
    };
  }
}
