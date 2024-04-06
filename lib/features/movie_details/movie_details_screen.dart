import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/features/movie_details/movie_details_controller.dart';
import 'package:movieapp/features/movie_details/widgets/lower_details_widget.dart';
import 'package:movieapp/features/movie_details/widgets/upper_details_widget.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpperDetailsMovieWidget(
              movie: controller.movie,
              iNavigator: controller.iNavigator,
            ),
            30.heightSpace,
            LowerDetailsMovieWidget(movie: controller.movie),
          ],
        ),
      ),
    );
  }
}
