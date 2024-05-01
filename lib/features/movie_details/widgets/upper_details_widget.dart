import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_image.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';
import 'package:movieapp/utils/pages/navigator.dart';
import 'package:movieapp/utils/utils.dart';

class UpperDetailsMovieWidget extends StatelessWidget {
  const UpperDetailsMovieWidget(
      {super.key, required this.movie, required this.iNavigator});
  final Movie movie;
  final INavigator iNavigator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 470,
      child: Stack(
        children: [
          CustomImage(
            path: Utils.getPosterPath(movie.posterPath),
            fit: BoxFit.cover,
            height: 470,
            width: double.infinity,
          ),
          Container(
            height: 470,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  blackColor.withOpacity(0),
                  Colors.black.withOpacity(.2),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                40.heightSpace,
                Row(
                  children: [
                    InkWell(
                      onTap: iNavigator.pop,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: whiteColor,
                      ),
                    ),
                    15.heightSpace,
                    Text(
                      "Watch",
                      style: context.label16400.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                200.heightSpace,
                Text(
                  "In theaters ${movie.releaseDate}",
                  style: context.label16400.copyWith(
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: 243,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: skyBlueColor,
                  ),
                  child: Center(
                    child: Text(
                      "Get Tickets",
                      style: context.label14400.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 243,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: skyBlueColor,
                      )),
                  child: Center(
                    child: Text(
                      "Watch Trailer",
                      style: context.label14400.copyWith(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
