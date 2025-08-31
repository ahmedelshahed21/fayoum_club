class AuthSuccessModel {
  final int version;
  final int code;
  final String status;
  final String? message;
  final AuthData data;

  AuthSuccessModel({
    required this.version,
    required this.code,
    required this.status,
    this.message,
    required this.data,
  });

  factory AuthSuccessModel.fromJson(Map<String, dynamic> json) {
    return AuthSuccessModel(
      version: json['version'] as int,
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String?,
      data: AuthData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "version": version,
      "code": code,
      "status": status,
      "message": message,
      "data": data.toJson(),
    };
  }
}

class AuthData {
  final int userId;
  final String name;
  final String phone;
  final String gender;
  final String? code;
  final String email;
  final String accessToken;
  final String refreshToken;
  final double expiresIn;

  AuthData({
    required this.userId,
    required this.name,
    required this.phone,
    required this.gender,
    this.code,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      userId: json['userId'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      code: json['code'] as String?,
      email: json['email'] as String,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "name": name,
      "phone": phone,
      "gender": gender,
      "code": code,
      "email": email,
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "expiresIn": expiresIn,
    };
  }
}
