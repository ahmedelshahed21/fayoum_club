import 'package:fayoum_club/core/constants/end_points.dart';

class RegisterDataModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;
  final String? code;
  final String gender;

  RegisterDataModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.code,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.phoneNumber: phoneNumber,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.code: code,
      ApiKey.gender: gender,
    };
  }

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) {
    return RegisterDataModel(
      name: json[ApiKey.name],
      phoneNumber: json[ApiKey.phoneNumber],
      email: json[ApiKey.email],
      password: json[ApiKey.password],
      code: json[ApiKey.code],
      gender: json[ApiKey.gender],
    );
  }
}
