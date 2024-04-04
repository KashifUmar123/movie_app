import 'package:get/get.dart';

class INavigator {
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  void popUntil(String route) {
    Get.until((data) => data.settings.name == route);
  }

  Future<T?>? pushNamed<T>(
    String route, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    return await Get.toNamed<T>(
      route,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  void offAndPushNamed(
    String route, {
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    Get.offNamed(route, arguments: arguments, id: id, parameters: parameters);
  }

  void pushReplacementNamed(
    String route, {
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    Get.offAllNamed(route, arguments: arguments);
  }
}
