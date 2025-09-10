import 'package:fayoum_club/core/utils/end_points.dart';

class ActivityModel {
  final int id;
  final String title;

  ActivityModel({required this.id, required this.title});

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json[ApiKey.id] ?? 0,
      title: json[ApiKey.title] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.id: id, ApiKey.title: title};
  }
}
