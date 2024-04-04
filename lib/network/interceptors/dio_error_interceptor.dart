import 'package:dio/dio.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

class CustomDioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Failure networkException;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        networkException = DioTimeoutError('Request timed out');
        break;
      case DioExceptionType.badResponse:
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
        break;
      default:
        networkException = SomethingWentWrong('Unknown Dio error: ${err.type}');
        break;
    }
    return handler.next(err.copyWith(error: networkException));
  }
}
