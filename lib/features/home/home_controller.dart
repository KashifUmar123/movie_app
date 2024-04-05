import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/home/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/usecases/fetch_upcoming_movies_list.dart';
import 'package:movieapp/initials/controllers/base_controller.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/pages/route_names.dart';

class HomeController extends BaseController {
  final FetchUpcomingMoviesUsecase _fetchUpcomingMoviesUsecase;
  HomeController({
    required super.iNavigator,
    required FetchUpcomingMoviesUsecase fetchUpcomingMoviesUsecase,
  }) : _fetchUpcomingMoviesUsecase = fetchUpcomingMoviesUsecase;

  // controll variables
  RxBool isLoading = false.obs;
  RxBool moviesLoading = false.obs;
  RxBool hasMore = true.obs;
  RxBool hasError = false.obs;
  RxString error = "".obs;

  RxList<Movie> movies = <Movie>[].obs;
  late UpcomingMoviesParams params;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    _registerPaginationListener();
    params = UpcomingMoviesParams(page: 1);
    fetchMovies(showLoader: true);
  }

  _registerPaginationListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        handlePagination();
      }
    });
  }

  void onMovieTap(Movie movie) {
    iNavigator.pushNamed(Routes.movieDetails, arguments: movie);
  }

  void handlePagination() {
    if (moviesLoading.value || !hasMore.value) {
      moviesLoading(false);
      return;
    }

    params.page++;
    fetchMovies();
  }

  Future<void> fetchMovies({showLoader = false}) async {
    hasError(false);
    moviesLoading(true);
    isLoading(showLoader);
    final result = await _fetchUpcomingMoviesUsecase.call(params);
    result.fold((left) {
      debugPrint("Error => ${left.message}");
      if (showLoader) {
        hasError(true);
        error(left.message);
      }
    }, (right) {
      if (right.totalPages == params.page) {
        hasMore(false);
      }
      movies.addAll(right.results);
    });
    isLoading(false);
    moviesLoading(false);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
}
