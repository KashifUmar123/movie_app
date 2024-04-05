import 'package:get/get.dart';
import 'package:movieapp/features/movie_details/movie_details_controller.dart';
import 'package:movieapp/utils/pages/navigator.dart';

class MovieDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      MovieDetailsController(
        iNavigator: Get.find<INavigator>(),
      ),
    );
  }
}
