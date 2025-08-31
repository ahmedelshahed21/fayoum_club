import 'package:fayoum_club/core/constants/end_points.dart';
import 'package:fayoum_club/core/data/models/localized_text_model.dart';


class BannersModel {
  final bool status;
  final LocalizedText message;
  final List<BannerData> data;

  BannersModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) {
    return BannersModel(
      status: json[ApiKey.status],
      message: LocalizedText.fromJson(json[ApiKey.message]),
      data: List<BannerData>.from(
        json[ApiKey.data].map((x) => BannerData.fromJson(x)),
      ),
    );
  }
}


class BannerData {
  final int id;
  final LocalizedText name;
  final String? url;
  final String? image;

  BannerData({
    required this.id,
    required this.name,
    this.url,
    this.image,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      id: json[ApiKey.id],
      name: LocalizedText.fromJson(json[ApiKey.name]),
      url: json[ApiKey.url],
      image: json[ApiKey.image],
    );
  }
}
