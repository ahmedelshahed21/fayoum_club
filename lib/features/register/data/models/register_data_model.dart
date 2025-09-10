import 'package:fayoum_club/core/utils/end_points.dart';

class RegisterDataModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final int isMember;
  final String? code;
  final String gender;

  RegisterDataModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.isMember,
    this.code,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.phone: phoneNumber,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.isMember: isMember,
      ApiKey.code: code,
      ApiKey.gender: gender,
    };
  }

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      name: json[ApiKey.name],
      phoneNumber: json[ApiKey.phone],
      email: json[ApiKey.email],
      password: json[ApiKey.password],
      isMember: json[ApiKey.isMember],
      code: json[ApiKey.code],
      gender: json[ApiKey.gender],
    );
  }
}
