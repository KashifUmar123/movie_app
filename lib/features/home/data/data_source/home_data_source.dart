import 'package:movieapp/features/home/services/data/upcoming_movies_params.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';

abstract class HomeDataSource {
  Future<UpcomingMovies> getMovies(UpcomingMoviesParams params);
}
