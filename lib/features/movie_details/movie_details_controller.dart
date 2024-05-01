import 'package:get/get.dart';
import 'package:movieapp/initials/controllers/base_controller.dart';
import 'package:movieapp/features/home/data/models/upcoming_movies_model.dart';

class MovieDetailsController extends BaseController {
  MovieDetailsController({required super.iNavigator});
  late Movie movie;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Movie) {
      movie = Get.arguments;
    }
  }
}
