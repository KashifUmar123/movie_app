import 'package:get/get.dart';

class Utils {
  static String getPosterPath(String image) {
    return "https://image.tmdb.org/t/p/w500$image";
  }

  static void showSnackBar({String title = "Opps", String? message}) {
    Get.snackbar(title, message ?? "");
  }
}
