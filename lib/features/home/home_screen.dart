import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/common_widgets/error_widget.dart';
import 'package:movieapp/features/home/home_controller.dart';
import 'package:movieapp/features/home/widgets/home_shimmer.dart';
import 'package:movieapp/features/home/widgets/movies_lists_widget.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          50.heightSpace,
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Upcoming Movies",
              style: context.label18400,
            ),
          ),
          14.heightSpace,
          Obx(
            () => Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildView(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildView(BuildContext context) {
    if (controller.hasError.value) {
      return CustomErrorWidget(
        title: controller.error.value,
      );
    } else if (controller.isLoading.value) {
      return const HomeShimmer();
    }
    return MoviesListWidget(
      movies: controller.movies,
      isLoadingMore: controller.moviesLoading.value,
      scrollController: controller.scrollController,
    );
  }
}
