import 'dart:developer';
import 'package:get/get.dart';
import 'package:movieapp/features/home/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/usecases/fetch_upcoming_movies_list.dart';
import 'package:movieapp/initials/controllers/base_controller.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';

class HomeController extends BaseController {
  final FetchUpcomingMoviesUsecase _fetchUpcomingMoviesUsecase;
  HomeController({
    required super.iNavigator,
    required FetchUpcomingMoviesUsecase fetchUpcomingMoviesUsecase,
  }) : _fetchUpcomingMoviesUsecase = fetchUpcomingMoviesUsecase;

  // controll variables
  RxBool isLoading = false.obs;
  RxBool hasMore = true.obs;
  RxBool hasError = false.obs;

  RxList<Movie> movies = <Movie>[].obs;
  late UpcomingMoviesParams params;

  @override
  void onInit() {
    super.onInit();
    params = UpcomingMoviesParams(page: 1);
    fetchMovies(showLoader: true);
  }

  Future<void> fetchMovies({showLoader = false}) async {
    hasError(false);
    isLoading(showLoader);
    final result = await _fetchUpcomingMoviesUsecase.call(params);
    result.fold((left) {
      log("Error => ${left.message}");
      if (showLoader) {
        hasError(true);
      }
    }, (right) {
      movies.addAll(right.results);
    });
    isLoading(false);
  }
}
