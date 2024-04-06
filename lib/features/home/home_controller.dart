import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/home/data/upcoming_movies_params.dart';
import 'package:movieapp/features/home/usecases/fetch_upcoming_movies_list.dart';
import 'package:movieapp/initials/controllers/base_controller.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/pages/route_names.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';
import 'package:movieapp/utils/utils.dart';

class HomeController extends BaseController {
  final FetchUpcomingMoviesUsecase _fetchUpcomingMoviesUsecase;
  final RemoteConfigService configService;
  final Alice alice;

  HomeController({
    required super.iNavigator,
    required FetchUpcomingMoviesUsecase fetchUpcomingMoviesUsecase,
    required RemoteConfigService remoteConfigService,
    required Alice aliceInspector,
  })  : _fetchUpcomingMoviesUsecase = fetchUpcomingMoviesUsecase,
        configService = remoteConfigService,
        alice = aliceInspector;

  // controll variables
  RxBool isLoading = false.obs;
  RxBool moviesLoading = false.obs;
  RxBool hasMore = true.obs;
  RxBool hasError = false.obs;
  RxString error = "".obs;

  RxList<Movie> movies = <Movie>[].obs;
  late UpcomingMoviesParams params;
  late ScrollController scrollController;

  bool get enableInspector => configService.enableApiInspector;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    _registerPaginationListener();
    params = UpcomingMoviesParams.defaultParams();
    fetchMovies(showLoader: true);
  }

  Future<void> onRefresh() async {
    params = UpcomingMoviesParams.defaultParams();
    await fetchMovies();
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
      } else {
        Utils.showSnackBar(message: left.message);
      }
    }, (right) {
      if (right.totalPages == params.page) {
        hasMore(false);
      }
      if (params.page == 1) {
        movies(right.results);
      } else {
        movies.addAll(right.results);
      }
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
