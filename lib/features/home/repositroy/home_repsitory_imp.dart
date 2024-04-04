import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:movieapp/features/home/repositroy/home_repository.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/network/exceptions/netwrok_exceptions.dart';
import 'package:movieapp/utils/constants/api_endpoints.dart';

class HomeRepositoryImp implements HomeRepository {
  final DioWrapper _dioWrapper;

  HomeRepositoryImp(this._dioWrapper);

  @override
  Future<Either<Failure, UpcomingMovies>> getMovies() async {
    final result = await _dioWrapper.onGet(api: ApiEndpoints.upcomingMovies);
    if (result.data != null) {
      UpcomingMovies movies = UpcomingMovies.fromJson(jsonDecode(result.data));
      return Right(movies);
    }

    return Left(SomethingWentWrong("Something wen't wrong"));
  }

  @override
  Future getMovieDetail(int id) async {}

  @override
  Future getMovieTrailerUrl(int id) async {}
}
