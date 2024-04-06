import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/utils/servcies/env_service.dart';

class RemoteConfigService {
  final EnvService _envService;

  RemoteConfigService({
    required EnvService envService,
  }) : _envService = envService;

  static final FirebaseRemoteConfig _remoteConfig =
      FirebaseRemoteConfig.instance;

  String get apiKey => _remoteConfig.getString(_ConfigServiceConstants.apiKey);
  String get baseUrl =>
      _remoteConfig.getString(_ConfigServiceConstants.baseUrl);
  bool get enableApiInspector =>
      _remoteConfig.getBool(_ConfigServiceConstants.enableApiInspector);

  Future<void> loadConfigs() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 15),
        minimumFetchInterval: const Duration(seconds: 2),
      ));
      await _remoteConfig.setDefaults({
        _ConfigServiceConstants.token: _envService.token,
        _ConfigServiceConstants.baseUrl: _envService.baseUrl,
        _ConfigServiceConstants.enableApiInspector: false,
      });
      await _remoteConfig.fetchAndActivate();
      log("Enable API INS: ${_remoteConfig.getBool(_ConfigServiceConstants.enableApiInspector)}");
    } catch (e) {
      debugPrint("Failed to inti firebase config. Error => $e");
    }
  }
}

class _ConfigServiceConstants {
  static const String token = "token";
  static const String apiKey = "api_key";
  static const String baseUrl = "base_url";
  static const String enableApiInspector = "enable_api_inspector";
}
