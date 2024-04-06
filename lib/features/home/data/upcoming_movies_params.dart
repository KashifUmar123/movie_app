class UpcomingMoviesParams {
  int page;

  UpcomingMoviesParams({
    required this.page,
  });

  factory UpcomingMoviesParams.defaultParams() {
    return UpcomingMoviesParams(page: 1);
  }
}
