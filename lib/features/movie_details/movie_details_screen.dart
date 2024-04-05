import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/features/movie_details/movie_details_controller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsController> {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Column(),
    );
  }
}
