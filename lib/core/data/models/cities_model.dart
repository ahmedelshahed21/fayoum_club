import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/data/models/ar_text_model.dart';
import 'package:fayoum_club/core/data/models/localized_text_model.dart';

class CitiesModel {
  final bool status;
  final LocalizedText message;
  final List<City> data;

  CitiesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      status: json[ApiKey.status] as bool,
      message: LocalizedText.fromJson(json[ApiKey.message]),
      data:
          (json[ApiKey.data] as List?)?.map((e) => City.fromJson(e)).toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.status: status,
      ApiKey.message: message.toJson(),
      ApiKey.data: data.map((e) => e.toJson()).toList(),
    };
  }
}

class City {
  final int id;
  final ArTextModel name;

  City({required this.id, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json[ApiKey.id] as int,
      name: ArTextModel.fromJson(json[ApiKey.name]),
    );
  }

  Map<String, dynamic> toJson() {
    return {ApiKey.id: id, ApiKey.name: name.toJson()};
  }
}
