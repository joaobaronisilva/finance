import 'package:dio/dio.dart';

import 'http.dart';

///
/// Implementation of [IHttpClient]
///
class HttpClient implements IHttpClient {
  /// Default ApiVersion
  static const _defaultApiVersion = 'v1';

  final String baseUrl;

  late final Dio _dio;

  HttpClient({required this.baseUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: <String, String>{'Content-Type': 'application/json'}));
  }

  String _buildPath(String path, {String? apiVersion}) => '$apiVersion/$path';

  @override
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? apiVersion = _defaultApiVersion,
  }) async =>
      _dio.delete(
        _buildPath(path, apiVersion: apiVersion),
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? apiVersion = _defaultApiVersion,
  }) async =>
      _dio.get(
        _buildPath(path, apiVersion: apiVersion),
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

  @override
  Future<Response> patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? apiVersion = _defaultApiVersion,
  }) async =>
      _dio.patch(
        _buildPath(path, apiVersion: apiVersion),
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

  @override
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? apiVersion = _defaultApiVersion,
  }) async =>
      _dio.post(
        _buildPath(path, apiVersion: apiVersion),
        data: data,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );

  @override
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    String? apiVersion = _defaultApiVersion,
  }) async =>
      _dio.put(
        _buildPath(path, apiVersion: apiVersion),
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
}
