import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/domain/entities/upcoming_movies_params.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';
import 'package:movieapp/network/exceptions/netwrok_failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, UpcomingMovies>> getMovies(
    UpcomingMoviesParams params,
  );
}
