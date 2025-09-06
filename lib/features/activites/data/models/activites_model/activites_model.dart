class ActivitesModel {
  final int? version;
  final int? code;
  final String? status;
  final String? message;
  final List<ActivityItem> data;

  ActivitesModel({
    this.version,
    this.code,
    this.status,
    this.message,
    required this.data,
  });

  factory ActivitesModel.fromJson(Map<String, dynamic> json) {
    return ActivitesModel(
      version: json['version'] as int?,
      code: json['code'] as int?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityItem.fromJson(e))
          .toList() ??
          [],
    );
  }
}

class ActivityItem {
  final int? id;
  final String? title;
  final String? description;
  final String? type;
  final String? image;
  final int? monyMember;
  final int? mony;
  final String? createdAt;
  final String? updatedAt;

  ActivityItem({
    this.id,
    this.title,
    this.description,
    this.type,
    this.image,
    this.monyMember,
    this.mony,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivityItem.fromJson(Map<String, dynamic> json) {
    return ActivityItem(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      monyMember: json['monyMember'] as int?,
      mony: json['mony'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}
