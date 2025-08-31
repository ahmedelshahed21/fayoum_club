import 'package:fayoum_club/core/constants/end_points.dart';

class ArTextModel {
  final String ar;

  ArTextModel({required this.ar});

  factory ArTextModel.fromJson(Map<String, dynamic> json) {
    return ArTextModel(ar: json[ApiKey.ar] as String);
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.ar: ar};
  }
}
