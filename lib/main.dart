import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/features/home/home_controller.dart';
import 'package:movieapp/initials/bindings/initial_bindings.dart';
import 'package:movieapp/utils/pages/app_pages.dart';
import 'package:movieapp/utils/pages/route_names.dart';
import 'package:movieapp/utils/servcies/firebase_remote_config_service.dart';
import 'package:movieapp/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBindings().initInitials();
  runApp(MovieApp(
    alice: Get.find<Alice>(),
  ));
}

class MovieApp extends StatefulWidget {
  const MovieApp({super.key, required this.alice});
  final Alice alice;

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: widget.alice.getNavigatorKey(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      getPages: AppRoutes.pages,
      initialRoute: Routes.splash,
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      Get.find<RemoteConfigService>().loadConfigs().then(
        (_) {
          if (Get.isRegistered<HomeController>()) {
            Get.find<HomeController>().update();
          }
        },
      );
    }
  }
}
