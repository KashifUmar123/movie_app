import 'package:dio/dio.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

Failure dioErrorWrapper(DioException err) {
  Failure networkException;
  if (err.type == DioExceptionType.connectionTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.receiveTimeout) {
    networkException = DioTimeoutError('Request timed out');
  } else if (err.type == DioExceptionType.badResponse) {
    switch (err.response?.statusCode) {
      case 401:
        networkException = AuthError('Unauthorized');
        break;
      case 404:
        networkException = ResourceNotFound('Resource not found');
        break;
      default:
        networkException =
            Failure('Unknown server error: ${err.response?.statusCode}');
        break;
    }
  } else if (err.type == DioExceptionType.connectionError) {
    return NoInternetConnection("No internet connection, Please retry");
  } else {
    networkException = SomethingWentWrong('Unknown Dio error: ${err.type}');
  }
  return networkException;
}
