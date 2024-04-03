import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String token = "";

  Future<void> loadEnv({String filename = ".env"}) async {
    try {
      await dotenv.load(fileName: filename);
      _populateVariables();
    } catch (e) {
      debugPrint("Failed to load env service. Error => $e");
    }
  }

  _populateVariables() {
    token = dotenv.env[_EnvConstants.token] ?? "";
  }
}

class _EnvConstants {
  static const String token = "TOKEN";
}
