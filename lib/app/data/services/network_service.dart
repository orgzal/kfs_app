import 'package:dio/dio.dart';

import '../providers/api_provider.dart';

class NetworkService {
  NetworkService({ApiProvider? apiProvider})
      : _apiProvider = apiProvider ?? ApiProvider();

  final ApiProvider _apiProvider;

  Dio get client => _apiProvider.client;

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return client.get(path, queryParameters: queryParameters);
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) {
    return client.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
