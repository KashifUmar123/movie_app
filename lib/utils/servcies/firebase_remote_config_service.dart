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

  late String stripeSecretKey;
  late String googleMapApiKeyAndroid;
  late String playstoreLink;
  late String appstoreLink;
  late num stripeCommision;

  Future<void> loadConfigs() async {
    try {
      await _remoteConfig.setDefaults({});
      await _remoteConfig.fetchAndActivate();

      stripeSecretKey =
          _remoteConfig.getString(_ConfigServiceConstants.stripeSecretKey);
      googleMapApiKeyAndroid = _remoteConfig
          .getString(_ConfigServiceConstants.googleMapApiKeyAndroid);
      playstoreLink =
          _remoteConfig.getString(_ConfigServiceConstants.playstoreLink);
      appstoreLink =
          _remoteConfig.getString(_ConfigServiceConstants.appstoreLink);

      stripeCommision =
          _remoteConfig.getDouble(_ConfigServiceConstants.stripeCommision);
    } catch (e) {
      debugPrint("Failed to inti firebase config. Error => $e");
    }
  }
}

class _ConfigServiceConstants {
  static const String stripeSecretKey = "stripe_secret_key";
  static const String googleMapApiKeyAndroid = "google_map_api_key";
  static const String playstoreLink = "playstore_link";
  static const String appstoreLink = "appstore_link";
  static const String stripeCommision = "stripe_commision";
}
