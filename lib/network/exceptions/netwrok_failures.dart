class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message;
  }
}

class NoInternetConnection extends Failure {
  NoInternetConnection(super.message);
}

class ResourceNotFound extends Failure {
  ResourceNotFound(super.message);
}

class AuthError extends Failure {
  AuthError(super.message);
}

class DioTimeoutError extends Failure {
  DioTimeoutError(super.message);
}

class SomethingWentWrong extends Failure {
  SomethingWentWrong(super.message);
}
