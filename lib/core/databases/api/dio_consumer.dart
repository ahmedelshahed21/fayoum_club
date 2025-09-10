import 'package:fayoum_club/core/utils/end_points.dart' show EndPoints;
import 'package:fayoum_club/core/databases/api/api_consumer.dart'
    show ApiConsumer;
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baserUrl;
  }

  /// default headers if none passed
  Map<String, String> get defaultHeaders => {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };

  //! POST
  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final res = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? defaultHeaders),
      );
      return res.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'message': 'Unknown error occurred'};
    }
  }

  //! PuT
  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
  }) async {
    try {
      final res = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? defaultHeaders),
      );
      return res.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'message': 'Unknown error occurred'};
    }
  }

  //! GET
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? defaultHeaders),
      );
      return res.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'message': 'Unknown error occurred'};
    }
  }

  //! DELETE
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers ?? defaultHeaders),
      );
      return res.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'message': 'Unknown error occurred'};
    }
  }

  //! PATCH
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    Options? options,
  }) async {
    try {
      final res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: options ?? Options(headers: headers ?? defaultHeaders),
      );
      return res.data;
    } on DioException catch (e) {
      return e.response?.data ?? {'message': 'Unknown error occurred'};
    }
  }
}
