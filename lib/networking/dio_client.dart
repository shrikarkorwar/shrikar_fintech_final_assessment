import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_end_points.dart';

class DioClient {
  final Dio _dio = Dio();
  final List<Interceptor>? interceptors;

  DioClient(this.interceptors) {
    _dio.options
      ..baseUrl = ApiEndPoints.baseUrl
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20)
      ..headers = {'Content-Type': 'application/json'}
      ..validateStatus = (status) {
        return status != null && status < 500;
      };
    if (interceptors != null && interceptors!.isNotEmpty) {
      _dio.interceptors.addAll(interceptors!);
    }

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true));
    }
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(path,
          queryParameters: queryParameters, options: options,cancelToken: cancelToken);

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return "TimeOut error";
      case DioExceptionType.badResponse:
        final statusCode = error.response!.statusCode;
        if (statusCode != null) {
          switch (statusCode) {
            case >= 300 && < 400:
              return 'Error';
            case 400:
              return 'Bad Request';
            case 404:
              return 'Not found';
            case 500:
              return 'Internal Server error';
          }
        }
        break;
      case DioExceptionType.cancel:
        return 'Cancelled by error';
      case DioExceptionType.unknown:
        return 'No Internet connection';
      case DioExceptionType.badCertificate:
        return 'Certificate error';
      case DioExceptionType.connectionError:
        return 'Connection error';
      default:
        return 'Unknown error';
    }
    return 'Unknown error';
  }
}
