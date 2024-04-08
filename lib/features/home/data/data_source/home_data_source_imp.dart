// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/features/home/services/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/services/data_source/home_data_source.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/network/exceptions/netwrok_failures.dart';
import 'package:movieapp/utils/constants/api_endpoints.dart';

class HomeDataSourceImp implements HomeDataSource {
  final DioWrapper _dioWrapper;
  HomeDataSourceImp({
    required DioWrapper dioWrapper,
  }) : _dioWrapper = dioWrapper;

  @override
  Future<UpcomingMovies> getMovies(UpcomingMoviesParams params) async {
    final result = await _dioWrapper.onGet(
        api: "${ApiEndpoints.upcomingMovies}&page=${params.page}");

    if (result.data != null) {
      return UpcomingMovies.fromJson(result.data);
    }

    throw SomethingWentWrong("Something wen't wrong");
  }
}
