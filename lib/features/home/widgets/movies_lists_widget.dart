import 'package:flutter/material.dart';
import 'package:movieapp/features/home/widgets/movie_tile_widget.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: movies
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MovieTileWidget(movie: e),
                ))
            .toList(),
      ),
    );
  }
}
