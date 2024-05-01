import 'package:movieapp/features/home/domain/entities/upcoming_movies_params.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';

abstract class HomeDataSource {
  Future<UpcomingMovies> getMovies(UpcomingMoviesParams params);
}
