import 'package:dio/dio.dart';
import 'package:moviemot/utils/constant.dart';

class ApiClient {
  static ApiClient? _instance;
  final Dio _dio;

  factory ApiClient() {
    if (_instance == null) {
      final dio = Dio(BaseOptions(baseUrl: Constant.baseUrl));

      _instance = ApiClient._(dio);
    }

    return _instance ??
        ApiClient._(
          Dio(
            BaseOptions(baseUrl: Constant.baseUrl),
          ),
        );
  }

  ApiClient._(this._dio);

  Future<Response> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: await _getHeaders(headers),
    );
  }

  Future<Options> _getHeaders(Map<String, String>? headers) async {
    return Options(
      headers: {}
        ..addAll(headers ?? {})
        ..addAll({
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer ${Constant.apiKey}',
        }),
    );
  }
}
