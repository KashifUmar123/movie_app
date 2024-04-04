import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/features/home/home_controller.dart';
import 'package:movieapp/features/home/widgets/movies_lists_widget.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(
        () => Column(
          children: [
            50.heightSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Upcoming Movies",
                style: context.label18400,
              ),
            ),
            if (!controller.isLoading.value)
              MoviesListWidget(
                movies: controller.movies,
              ),
          ],
        ),
      ),
    );
  }
}
