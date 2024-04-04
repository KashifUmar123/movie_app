import 'package:dartz/dartz.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';

abstract class HomeRepository {
  Future<Either<Failure, UpcomingMovies>> getMovies();
  Future getMovieDetail(int id);
  Future getMovieTrailerUrl(int id);
}
