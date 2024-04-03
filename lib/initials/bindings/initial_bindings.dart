import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/utils/servcies/env_service.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';
import 'package:movieapp/utils/servcies/local_storage_service.dart';

class InitialBindings {
  Future<void> initInitials() async {
    // init firebase
    await Firebase.initializeApp();

    // enable and set crashlytics crashlytics
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Env Service
    Get.lazyPut<EnvService>(() => EnvService());
    await Get.find<EnvService>().loadEnv();

    // local storage service
    Get.lazyPut<StorageService>(() => StorageService());
    await Get.find<StorageService>().loadData();
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
