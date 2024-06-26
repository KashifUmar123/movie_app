import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/domain/entities/upcoming_movies_params.dart';
import 'package:movieapp/features/home/data/data_source/home_data_source.dart';
import 'package:movieapp/features/home/domain/repositories/home_repository.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';
import 'package:movieapp/network/exceptions/netwrok_failures.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImp(this._dataSource);

  @override
  Future<Either<Failure, UpcomingMovies>> getMovies(
    UpcomingMoviesParams params,
  ) async {
    try {
      final result = await _dataSource.getMovies(params);
      return Right(result);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(SomethingWentWrong("Something wen't wrong"));
    }
  }
}
