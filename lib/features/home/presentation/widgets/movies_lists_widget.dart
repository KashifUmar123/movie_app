import 'package:flutter/material.dart';
import 'package:movieapp/features/home/presentation/widgets/movie_tile_widget.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/constants/app_colors.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
    super.key,
    required this.movies,
    this.isLoadingMore = false,
    required this.scrollController,
    required this.onMovieTap,
  });

  final List<Movie> movies;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final Function(Movie)? onMovieTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.zero,
      itemCount: movies.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MovieTileWidget(
              movie: movies[index],
              onMovieTap: () {
                onMovieTap?.call(movies[index]);
              },
            ),
          );
        } else {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: CircularProgressIndicator(
                color: blackColor,
              ),
            ),
          );
        }
      },
    );
  }
}
