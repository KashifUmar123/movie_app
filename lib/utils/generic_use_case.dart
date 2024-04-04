import 'package:dartz/dartz.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
