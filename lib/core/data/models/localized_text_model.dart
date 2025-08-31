import '../../constants/end_points.dart';

class LocalizedText {
  final String ar;
  final String en;

  LocalizedText({required this.ar, required this.en});

  factory LocalizedText.fromJson(Map<String, dynamic> json) {
    return LocalizedText(
      ar: json[ApiKey.ar] as String,
      en: json[ApiKey.en] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.ar: ar,
      ApiKey.en: en,
    };
  }
}