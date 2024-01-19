import 'package:dio/dio.dart';

class DioClient {
  static const String baseUrl = 'https://api.example.com'; // Replace with your API base URL

  Dio _dio = Dio();

  DioClient() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ));

  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make GET request: $e');
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make POST request: $e');
    }
  }

  Future<Response> put(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return response;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make PUT request: $e');
    }
  }

  Future<Response> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return response;
    } catch (e) {
      // Handle errors
      throw Exception('Failed to make DELETE request: $e');
    }
  }

}
