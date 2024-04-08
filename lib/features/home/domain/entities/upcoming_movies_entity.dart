import 'package:equatable/equatable.dart';

class UpcomingMoviesEntity extends Equatable {
  final DateRange dates;
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  const UpcomingMoviesEntity({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  List<Object> get props => [dates, page, results, totalPages, totalResults];
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
}
