class EndPoints {
  static const String baserUrl = "https://fayoum-club.com/GovernorateClub/api";
  static const String login = "/login";
  static const String register = "/register";
  static const String banners = "/news/lookup";
  static const String news = "/news";
  static const String activities = "/activate/lookup";
  static  String activityDetails(int activityId) => "/activate/$activityId";
  static const String paymentProcess = "/mony-pay";
  static const String contactUs = "/details";
}

class ApiKey {
  // General
  static const String data = "data";
  static const String id = "id";
  static const String name = "name";
  static const String type = "type";
  static const String typeOption="typeOption";
  static const String value = "value";
  static const String code = "code";
  static const String version = "version";

  // User & Auth
  static const String email = "email";
  static const String password = "password";
  static const String passwordConfirmation = "password_confirmation";
  static const String currentPassword = "oldPassword";
  static const String newPassword = "newPassword";
  static const String newPasswordConfirmation = "confirmPassword";
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String expiresIn = "expiresIn";
  static const String user = "user";
  static const String userId = "userId";
  static const String isMember = "isMember";
  static const String image = "image";
  static const String gender = "gender";
  static const String phone = "phone";

  // Content / Entities
  static const String title = "title";
  static const String description = "description";
  static const String details = "details";
  static const String item = "item";
  static const String items = "items";
  static const String currency = "currency";
  static const String subject = "subject";
  static const String body = "body";

  // Languages
  static const String ar = "ar";
  static const String en = "en";

  static const String active = "active";

  // Pagination / Meta
  static const String pagination = "pagination";
  static const String currentPage = "currentPage";
  static const String lastPage = "last_page";
  static const String perPage = "perPage";
  static const String total = "total";
  static const String totalPages = "totalPages";

  // Status / Response
  static const String status = "status";
  static const String message = "message";
  static const String errors = "errors";

  // Others
  static const String createdAt = "createdAt";
  static const String updatedAt = "updatedAt";
  static const String isActive = "isActive";
  static const String moneyMember = "monyMember";
  static const String money = "mony";
  static const String captains = "captans";
  static const String activityId = "activateId";

  // Captain Time
  static const String time = "time";
  static const String captainId = "captin_id";
  static const String day = "day";
  static const String fromTime = "from_time";
  static const String toTime = "to_time";
  static const String note = "note";
}

class Params {
  static const String status = "status";
  static const String page = 'page';
  static const String authorization = 'authorization';
  static const String bearer = 'Bearer';
  static const String accept = 'Accept';
  static const String applicationJson = 'application/json';
  static const String contentType = 'contentType';
  static const String multipartFormData = 'multipartFormData';
  static const String type = 'type';
}
