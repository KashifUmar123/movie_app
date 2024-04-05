import 'package:flutter/material.dart';
import 'package:movieapp/features/home/widgets/movie_tile_widget.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
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
    return ListView(
      controller: scrollController,
      padding: EdgeInsets.zero,
      children: [
        ...movies.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MovieTileWidget(
              movie: e,
              onMovieTap: () {
                onMovieTap?.call(e);
              },
            ),
          ),
        ),
        if (isLoadingMore)
          const Center(
            child: CircularProgressIndicator(
              color: blackColor,
            ),
          )
      ],
    );
  }
}
