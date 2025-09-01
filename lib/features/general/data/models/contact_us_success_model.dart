class ContactUSSuccessModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final ContactUSData data;

  ContactUSSuccessModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    required this.data,
  });

  factory ContactUSSuccessModel.fromJson(Map<String, dynamic> json) {
    return ContactUSSuccessModel(
      version: json['version'] as int,
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'],
      data: ContactUSData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'code': code,
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ContactUSData {
  final int id;
  final String details;
  final String name;
  final String phone;
  final String createdAt;
  final String updatedAt;

  ContactUSData({
    required this.id,
    required this.details,
    required this.name,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ContactUSData.fromJson(Map<String, dynamic> json) {
    return ContactUSData(
      id: json['id'] as int,
      details: json['details'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'details': details,
      'name': name,
      'phone': phone,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
