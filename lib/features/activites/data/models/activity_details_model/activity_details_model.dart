class ActivityDetailsModel {
  final int version;
  final int code;
  final String? message;
  final ActivityDetailsData? data;

  ActivityDetailsModel({
    required this.version,
    required this.code,
    this.message,
    this.data,
  });

  factory ActivityDetailsModel.fromJson(Map<String, dynamic> json) {
    return ActivityDetailsModel(
      version: json['version'],
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? ActivityDetailsData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class ActivityDetailsData {
  final int id;
  final String description;
  final String? type;
  final String image;
  final String title;
  final String createdAt;
  final String updatedAt;
  final List<CaptainModel> captans;

  ActivityDetailsData({
    required this.id,
    required this.description,
    this.type,
    required this.image,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.captans,
  });

  factory ActivityDetailsData.fromJson(Map<String, dynamic> json) {
    return ActivityDetailsData(
      id: json['id'],
      description: json['description'],
      type: json['type'],
      image: json['image'],
      title: json['title'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      captans: (json['captans'] as List<dynamic>?)
          ?.map((e) => CaptainModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'type': type,
      'image': image,
      'title': title,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'captans': captans.map((e) => e.toJson()).toList(),
    };
  }
}

class CaptainModel {
  final int id;
  final String name;
  final String description;
  final int activateId;
  final int isActive;
  final String image;
  final String createdAt;
  final String updatedAt;

  CaptainModel({
    required this.id,
    required this.name,
    required this.description,
    required this.activateId,
    required this.isActive,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CaptainModel.fromJson(Map<String, dynamic> json) {
    return CaptainModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      activateId: json['activateId'],
      isActive: json['isActive'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'activateId': activateId,
      'isActive': isActive,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
