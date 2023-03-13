import 'package:dio/dio.dart';

///
/// Contract for HttpClient implementations
///
abstract class IHttpClient {
  /// Handy method to make http POST request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    String? apiVersion,
  });

  /// Handy method to make http GET request
  Future<Response> get(
    String path, {
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    String? apiVersion,
  });

  /// Handy method to make http DELETE request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    String? apiVersion,
  });

  /// Handy method to make http PATCH request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    String? apiVersion,
  });

  /// Handy method to make http PUT request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Map<String, String>? headers,
    String? apiVersion,
  });
}
