import 'package:get/get.dart';
import 'package:movieapp/utils/pages/navigator.dart';

class BaseController extends GetxController {
  final INavigator iNavigator;
  BaseController({required this.iNavigator});
}
