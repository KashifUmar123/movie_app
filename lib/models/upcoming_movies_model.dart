import 'package:equatable/equatable.dart';

class UpcomingMovies extends Equatable {
  final DateRange dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const UpcomingMovies({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [dates, page, results, totalPages, totalResults];

  factory UpcomingMovies.fromJson(Map<String, dynamic> json) {
    return UpcomingMovies(
      dates: DateRange.fromJson(json['dates'] ?? {}),
      page: json['page'] ?? 0,
      results: json['results'] != null
          ? List<Movie>.from(json['results'].map((x) => Movie.fromJson(x)))
          : [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}

class DateRange extends Equatable {
  final String maximum;
  final String minimum;

  const DateRange({
    required this.maximum,
    required this.minimum,
  });

  @override
  List<Object> get props => [maximum, minimum];

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      maximum: json['maximum'] ?? "",
      minimum: json['minimum'] ?? "",
    );
  }
}

class Movie extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? "",
      genreIds:
          json['genre_ids'] != null ? List<int>.from(json['genre_ids']) : [],
      id: json['id'] ?? 0,
      originalLanguage: json['original_language'] ?? "",
      originalTitle: json['original_title'] ?? "",
      overview: json['overview'] ?? "",
      popularity: (json['popularity'] != null && json['popularity'] is num)
          ? json['popularity'].toDouble()
          : 0,
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'] ?? "",
      title: json['title'] ?? "",
      video: json['video'] ?? "",
      voteAverage: (json['vote_average'] != null && json['vote_average'] is num)
          ? json['vote_average'].toDouble()
          : 0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
