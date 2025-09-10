import 'package:fayoum_club/core/utils/end_points.dart';

class ContactUsRequestModel {
  final String name;
  final String phoneNumber;
  final String message;

  ContactUsRequestModel({
    required this.name,
    required this.phoneNumber,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.phone: phoneNumber,
      ApiKey.details: message,
    };
  }

  factory ContactUsRequestModel.fromJson(Map<String, dynamic> json) {
    return ContactUsRequestModel(
      name: json[ApiKey.name],
      phoneNumber: json[ApiKey.phone],
      message: json[ApiKey.details],
    );
  }
}
