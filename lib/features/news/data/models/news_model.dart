class NewsModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final List<NewsItem>? data;

  NewsModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    this.data,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      version: json['version'] ?? 0,
      code: json['code'] ?? 0,
      status: json['status'] ?? '',
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
          .map((e) => NewsItem.fromJson(e))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "version": version,
      "code": code,
      "status": status,
      "message": message,
      "data": data?.map((e) => e.toJson()).toList(),
    };
  }
}

class NewsItem {
  final int id;
  final String title;
  final String description;
  final Activate? activate; // nullable
  final int status;
  final String typeOption;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsItem({
    required this.id,
    required this.title,
    required this.description,
    this.activate,
    required this.status,
    required this.typeOption,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      activate: json['activate'] != null
          ? Activate.fromJson(json['activate'])
          : null,
      status: json['status'] ?? 0,
      typeOption: json['typeOption'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt:DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "activate": activate?.toJson(),
      "status": status,
      "typeOption": typeOption,
      "image": image,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}

class Activate {
  final int id;
  final String title;

  Activate({
    required this.id,
    required this.title,
  });

  factory Activate.fromJson(Map<String, dynamic> json) {
    return Activate(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
    };
  }
}
