import 'dart:async';

import 'package:movieapp/initials/controllers/base_controller.dart';
import 'package:movieapp/utils/pages/route_names.dart';

class SplashController extends BaseController {
  SplashController({required super.iNavigator});

  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      iNavigator.pushNamed(Routes.home);
    });
  }
}
