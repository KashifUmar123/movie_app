import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_image.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/size_extension.dart';

class MovieTileWidget extends StatefulWidget {
  const MovieTileWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieTileWidget> createState() => _MovieTileWidgetState();
}

class _MovieTileWidgetState extends State<MovieTileWidget> {
  @override
  void initState() {
    super.initState();
  }

  String _getImageUrl(String imagePath) {
    return "https://image.tmdb.org/t/p/w500$imagePath";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: context.width,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CustomImage(
              path: _getImageUrl(widget.movie.backdropPath),
              fit: BoxFit.cover,
              height: 180,
              width: context.width,
            ),
          ),
          InkWell(
            onTap: () async {
              // upcomingMoviesViewModel.setSelectedResults(widget.results);
              // navService.nav.pushNamed(Routes.movieDetails);
            },
            child: Container(
              height: 180,
              width: context.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    blackColor.withOpacity(0),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.movie.title,
                      style: const TextStyle(
                        color: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
