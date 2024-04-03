import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/initials/bindings/initial_bindings.dart';
import 'package:movieapp/utils/pages/app_pages.dart';
import 'package:movieapp/utils/pages/route_names.dart';
import 'package:movieapp/utils/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitialBindings().initInitials();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      getPages: AppRoutes.pages,
      initialRoute: Routes.splash,
    );
  }
}
