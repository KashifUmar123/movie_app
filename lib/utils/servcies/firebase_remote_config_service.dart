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

  // String get token => _remoteConfig.getString(_ConfigServiceConstants.token);
  String get apiKey => _remoteConfig.getString(_ConfigServiceConstants.apiKey);

  Future<void> loadConfigs() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 0),
      ));
      await _remoteConfig.setDefaults({
        _ConfigServiceConstants.token: _envService.token,
      });
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      debugPrint("Failed to inti firebase config. Error => $e");
    }
  }
}

class _ConfigServiceConstants {
  static const String token = "token";
  static const String apiKey = "api_key";
}
