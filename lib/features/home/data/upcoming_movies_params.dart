class UpcomingMoviesParams {
  int page;
  UpcomingMoviesParams({
    required this.page,
  });
}

class NoParms {
  Map<String, dynamic> toMap() => {};
}
