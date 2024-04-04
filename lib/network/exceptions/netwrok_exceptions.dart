class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoInternetConnection extends NetworkException {
  NoInternetConnection(super.message);
}

class ResourceNotFound extends NetworkException {
  ResourceNotFound(super.message);
}

class AuthError extends NetworkException {
  AuthError(super.message);
}

class DioTimeoutError extends NetworkException {
  DioTimeoutError(super.message);
}

class SomethingWentWrong extends NetworkException {
  SomethingWentWrong(super.message);
}
