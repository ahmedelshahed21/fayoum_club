import 'package:fayoum_club/core/utils/end_points.dart';

class AuthSuccessModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final AuthData data;

  AuthSuccessModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    required this.data,
  });

  factory AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    return AuthSuccessModel(
      version: json[ApiKey.version] as int,
      code: json[ApiKey.code] as int,
      status: json[ApiKey.status] as String,
      message: json[ApiKey.message] as String?,
      data: AuthData.fromJson(json[ApiKey.data] as Map<String, dynamic>),
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

class AuthData {
  final int userId;
  final String name;
  final String phone;
  final String email;
  final String accessToken;
  final String refreshToken;
  final double expiresIn;

  AuthData({
    required this.userId,
    required this.name,
    required this.phone,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      userId: json[ApiKey.userId] as int,
      name: json[ApiKey.name] as String,
      phone: json[ApiKey.phone] as String,
      email: json[ApiKey.email] as String,
      accessToken: json[ApiKey.accessToken] as String,
      refreshToken: json[ApiKey.refreshToken] as String,
      expiresIn: (json[ApiKey.expiresIn] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.userId: userId,
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.email: email,
      ApiKey.accessToken: accessToken,
      ApiKey.refreshToken: refreshToken,
      ApiKey.expiresIn: expiresIn,
    };
  }
}
