import 'package:flutter/material.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class LowerDetailsMovieWidget extends StatelessWidget {
  const LowerDetailsMovieWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Genres",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              _genresWidgetTile(
                context,
                text: "Action",
                color: greenColor,
              ),
              _genresWidgetTile(
                context,
                text: "Thriller",
                color: pinkColor,
              ),
              _genresWidgetTile(
                context,
                text: "Science",
                color: blueColor,
              ),
              _genresWidgetTile(
                context,
                text: "Fiction",
                color: yellowColor,
              ),
            ],
          ),
          22.heightSpace,
          Divider(
            color: greyColor.withOpacity(.15),
            height: 1,
          ),
          15.heightSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Overview",
              style: context.label16400,
            ),
          ),
          14.heightSpace,
          Text(
            movie.overview,
            style: context.label14400.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _genresWidgetTile(
    BuildContext context, {
    required String text,
    required Color color,
  }) {
    return Container(
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: context.label14400.copyWith(fontSize: 12, color: whiteColor),
        ),
      ),
    );
  }
}
