import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  late bool isLoggedIn = false;
  late GetStorage storage;

  Future<void> loadData() async {
    try {
      await GetStorage.init();
      storage = GetStorage();
      _loadVariables();
    } catch (e) {
      debugPrint("Failed to load Shared Prefernces: Error => $e");
    }
  }

  _loadVariables() {
    // laod variables when needed
  }

  Future<void> write<T>({required String key, required T data}) async {
    await storage.write(key, data);
  }
}

class StorageConstants {}
