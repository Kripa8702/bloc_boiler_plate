import 'package:bloc_boiler_plate/config/flavour_config.dart';
import 'package:bloc_boiler_plate/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class DioClient {
  final FlavorConfig flavorConfig;
  Dio _dio = Dio();

  DioClient({required this.flavorConfig}) {
    _dio = Dio(BaseOptions(
      baseUrl: flavorConfig.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ));
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    _dio.options.headers = headers;
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
    ));
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw UnAuthorizedException(response.data['message'], statusCode: 401);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.data['message'], statusCode: 400);
      } else {
        throw OtherException(response.data['message'],
            statusCode: response.statusCode ?? 500);
      }
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make GET request: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw UnAuthorizedException(response.data['message'], statusCode: 401);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.data['message'], statusCode: 400);
      } else {
        throw OtherException(response.data['message'],
            statusCode: response.statusCode ?? 500);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw UnAuthorizedException(response.data['message'], statusCode: 401);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.data['message'], statusCode: 400);
      } else {
        throw OtherException(response.data['message'],
            statusCode: response.statusCode ?? 500);
      }
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make PUT request: $e');
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw UnAuthorizedException(response.data['message'], statusCode: 401);
      } else if (response.statusCode == 400) {
        throw BadRequestException(response.data['message'], statusCode: 400);
      } else {
        throw OtherException(response.data['message'],
            statusCode: response.statusCode ?? 500);
      }
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make DELETE request: $e');
    }
  }
}
