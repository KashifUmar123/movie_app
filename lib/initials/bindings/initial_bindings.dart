import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/network/dio_wrapper.dart';
import 'package:movieapp/network/interceptors/dio_auth_interceptor.dart';
import 'package:movieapp/utils/pages/navigator.dart';
import 'package:movieapp/utils/servcies/env_service.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';
import 'package:movieapp/utils/servcies/local_storage_service.dart';

import '../../features/home/presentation/home_bindings.dart';

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

    // register dio
    Get.lazyPut(
      () => Dio(
        BaseOptions(
          baseUrl: Get.find<RemoteConfigService>().baseUrl,
          connectTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ),
    );

    // Alice inspector
    Get.lazyPut(
      () => Alice(),
    );

    Get.find<Dio>().interceptors.addAll(
      [
        AuthInterceptor(Get.find<RemoteConfigService>()),
        // Get.find<Alice>().getDioInterceptor(),
      ],
    );

    // put diowrapper
    Get.lazyPut(() => DioWrapper(dio: Get.find<Dio>()));

    // put iNavigator
    Get.lazyPut<INavigator>(() => INavigator());
  }
}
