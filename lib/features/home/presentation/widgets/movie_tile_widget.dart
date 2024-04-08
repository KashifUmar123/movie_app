import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_image.dart';
import 'package:movieapp/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/size_extension.dart';
import 'package:movieapp/utils/utils.dart';

class MovieTileWidget extends StatelessWidget {
  const MovieTileWidget({
    super.key,
    required this.movie,
    required this.onMovieTap,
  });

  final Movie movie;
  final VoidCallback onMovieTap;

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
              path: Utils.getPosterPath(movie.backdropPath),
              fit: BoxFit.cover,
              height: 180,
              width: context.width,
            ),
          ),
          InkWell(
            onTap: onMovieTap,
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
                      movie.title,
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
