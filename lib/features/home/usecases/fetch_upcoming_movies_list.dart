import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/repositroy/home_repository.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';
import 'package:movieapp/utils/generic_use_case.dart';

class FetchUpcomingMoviesUsecase
    extends UseCase<UpcomingMovies, UpcomingMoviesParams> {
  final HomeRepository _homeRepository;

  FetchUpcomingMoviesUsecase({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  @override
  Future<Either<Failure, UpcomingMovies>> call(
      UpcomingMoviesParams params) async {
    return _homeRepository.getMovies(params);
  }
}
