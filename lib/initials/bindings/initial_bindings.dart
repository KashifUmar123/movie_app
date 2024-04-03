import 'package:get/get.dart';
import 'package:movieapp/utils/servcies/env_service.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';

class InitialBindings {
  Future<void> initInitials() async {
    // Env Service
    Get.lazyPut<EnvService>(() => EnvService());
    await Get.find<EnvService>().loadEnv();
    // Remote Config Service
    Get.lazyPut<RemoteConfigService>(
      () => RemoteConfigService(
        envService: Get.find<EnvService>(),
      ),
    );
    await Get.find<RemoteConfigService>().loadConfigs();

    // analytics
    // crashlytics
    // environment vars
    // shared Prefrences
  }
}
