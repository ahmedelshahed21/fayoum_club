import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/data/models/localized_text_model.dart';

class PriceModel {
  final num value;
  final String formated;
  final LocalizedText currency;

  PriceModel({
    required this.value,
    required this.formated,
    required this.currency,
  });

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      value: json[ApiKey.value],
      formated: json['formated'],
      currency: LocalizedText.fromJson(json[ApiKey.currency]),
    );
  }
}

class ValueLabelModel {
  final String value;
  final LocalizedText label;

  ValueLabelModel({required this.value, required this.label});

  factory ValueLabelModel.fromJson(Map<String, dynamic> json) {
    return ValueLabelModel(
      value: json[ApiKey.value],
      label: LocalizedText.fromJson(json[ApiKey.label]),
    );
  }
}
