import 'package:get/get.dart';
import 'package:movieapp/features/splash/splash_controller.dart';
import 'package:movieapp/utils/pages/navigator.dart';

class SplashBindins extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(iNavigator: Get.find<INavigator>()));
  }
}
