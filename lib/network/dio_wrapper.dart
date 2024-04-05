import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';
import 'package:movieapp/network/interceptors/dio_error_interceptor.dart';

class DioWrapper {
  final Dio _dio;
  DioWrapper({required Dio dio}) : _dio = dio;

  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _resolveAPIMetadata(headers: headers, queryParameters: queryParameters);

      return await _dio.get(api);
    } on SocketException catch (_) {
      throw NoInternetConnection("No Internet Connection");
    } on DioException catch (err) {
      throw dioErrorWrapper(err);
    } catch (e) {
      throw SomethingWentWrong("Something wen't wrong");
    }
  }

  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      _resolveAPIMetadata(headers: headers, queryParameters: queryParameters);
      return await _dio.post(api, data: data, queryParameters: {});
    } on SocketException catch (_) {
      throw NoInternetConnection("No Internet Connection");
    } on DioException catch (err) {
      throw dioErrorWrapper(err);
    } catch (e) {
      throw SomethingWentWrong("Something wen't wrong");
    }
  }

  void _resolveAPIMetadata({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    if (queryParameters != null) {
      _dio.options.queryParameters.addAll(queryParameters);
    }
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
  }
}
