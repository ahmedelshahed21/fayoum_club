import 'package:fayoum_club/core/utils/app_constants.dart';
import 'package:fayoum_club/core/databases/cache/user_data_manager.dart';
import 'package:fayoum_club/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class PayMobRepo {
  UserDataManager userDataManager = getIt<UserDataManager>();

  Future<String> getPaymentKey(
    int amount,
    String currency,
    String description,
  ) async {
    try {
      String authenticationToken = await _getAuthenticationToken();

      int orderId = await _getOrderId(
        authenticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        description: description,
      );

      String paymentKey = await _getPaymentKey(
        authenticationToken: authenticationToken,
        amount: (100 * amount).toString(),
        currency: currency,
        orderId: orderId.toString(),
      );
      return paymentKey;
    } catch (e) {
      if (e is DioException) {
        // print("PayMob Error Response: ${e.response?.data}");
        // print("PayMob Status Code: ${e.response?.statusCode}");
      }
      // else {
      //   print("Unknown error: $e");
      // }
      throw Exception("حدث خطأ أثناء إنشاء مفتاح الدفع");
    }
  }

  Future<String> _getAuthenticationToken() async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/auth/tokens",
      data: {"api_key": PayMobConstants.payMobApikey},
    );
    return response.data["token"];
  }

  Future<int> _getOrderId({
    required String authenticationToken,
    required String amount,
    required String currency,
    required String description,
  }) async {
    final Response response = await Dio().post(
      "https://accept.paymob.com/api/ecommerce/orders",
      data: {
        "auth_token": authenticationToken,
        "amount_cents": amount,
        "currency": currency,
        "delivery_needed": "false",
        "items": [
          {
            "name": 'Chef Hamdy',
            "amount_cents": '500000',
            "description": description,
            "quantity": '1',
          },
        ],
      },
    );
    return response.data["id"];
  }

  Future<String> _getPaymentKey({
    required String authenticationToken,
    required String orderId,
    required String amount,
    required String currency,
  }) async {
    try {
      final Response response = await Dio().post(
        "https://accept.paymob.com/api/acceptance/payment_keys",
        data: {
          "expiration": 3600,
          "auth_token": authenticationToken,
          "order_id": orderId,
          "integration_id": PayMobConstants.cardPaymentMethodIntegrationId,
          "amount_cents": amount,
          "currency": currency,
          "billing_data": {
            "first_name": userDataManager.getUserName(),
            "last_name": 'Customer',
            "email": userDataManager.getUserEmail(),
            "phone_number": userDataManager.getUserPhoneNumber(),
            "apartment": "NA",
            "floor": "NA",
            "street": "NA",
            "building": "NA",
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "state": "NA",
          },
        },
      );
      return response.data["token"];
    } catch (e) {
      // if (e is DioException) {
      //   print("Payment Key Request Error: ${e.response?.data}");
      //   print("Status Code: ${e.response?.statusCode}");
      // }
      rethrow;
    }
  }
}
