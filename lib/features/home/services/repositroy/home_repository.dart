import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/services/data/upcoming_movies_params.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

abstract class HomeRepository {
  Future<Either<Failure, UpcomingMovies>> getMovies(
    UpcomingMoviesParams params,
  );
  Future getMovieDetail(int id);
  Future getMovieTrailerUrl(int id);
}
