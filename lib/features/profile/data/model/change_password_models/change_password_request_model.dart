import 'package:fayoum_club/core/utils/end_points.dart';

class ChangePasswordRequestModel {
  final String currentPassword;
  final String newPassword;
  final String newPasswordConfirmation;

  ChangePasswordRequestModel({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.currentPassword: currentPassword,
      ApiKey.newPassword: newPassword,
      ApiKey.newPasswordConfirmation: newPasswordConfirmation,
    };
  }

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRequestModel(
      currentPassword: json[ApiKey.currentPassword],
      newPassword: json[ApiKey.newPassword],
      newPasswordConfirmation: json[ApiKey.newPasswordConfirmation],
    );
  }
}
