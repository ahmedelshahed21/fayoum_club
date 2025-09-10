import 'package:fayoum_club/core/utils/end_points.dart';

class ValidationModel {
  final String status;
  final String message;
  final List<String> errors;
  final int code;

  ValidationModel({
    required this.status,
    required this.message,
    required this.errors,
    required this.code,
  });

  factory ValidationModel.fromJson(Map<String, dynamic> json) {
    return ValidationModel(
      status: json[ApiKey.status] as String,
      message: json[ApiKey.message] as String,
      errors: List<String>.from(json[ApiKey.errors].map((e) => e as String)),
      code: json[ApiKey.code] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.status: status,
      ApiKey.message: message,
      ApiKey.errors: errors,
      ApiKey.code: code,
    };
  }
}
