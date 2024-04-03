import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String googleMapApiKey = "";
  String stripeConnectSecretKey = "";
  Future<void> loadEnv({String filename = ".env"}) async {
    try {
      await dotenv.load(fileName: filename);
      _populateVariables();
    } catch (e) {
      debugPrint("Failed to load env service. Error => $e");
    }
  }

  _populateVariables() {
    googleMapApiKey = dotenv.env[EnvConstants.googleMapApiKey] ?? "";
    stripeConnectSecretKey =
        dotenv.env[EnvConstants.stripeConnectSecretKey] ?? "";
  }
}

class EnvConstants {
  static const String googleMapApiKey = "GOOGLE_MAP_API_KEY";
  static const String stripeConnectSecretKey = "STRIPE_CONNECT_SECRET_KEY";
}
