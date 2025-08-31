class AuthFailureModel {
  final String status;
  final String message;
  final List<String> errors;
  final int code;

  AuthFailureModel({
    required this.status,
    required this.message,
    required this.errors,
    required this.code,
  });

  factory AuthFailureModel.fromJson(Map<String, dynamic> json) {
    return AuthFailureModel(
      status: json['status'] as String,
      message: json['message'] as String,
      errors: List<String>.from(json['errors'].map((e) => e as String)),
      code: json['code'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "errors": errors,
      "code": code,
    };
  }
}
