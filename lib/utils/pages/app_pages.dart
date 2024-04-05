import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movieapp/features/home/home_bindings.dart';
import 'package:movieapp/features/home/home_screen.dart';
import 'package:movieapp/features/movie_details/movie_details_bindings.dart';
import 'package:movieapp/features/movie_details/movie_details_screen.dart';
import 'package:movieapp/features/splash/splash_bindings.dart';
import 'package:movieapp/features/splash/splash_screen.dart';
import 'package:movieapp/utils/pages/route_names.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      binding: SplashBindins(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.movieDetails,
      page: () => const MovieDetailsScreen(),
      binding: MovieDetailsBindings(),
    ),
  ];

  static GetPage getPage({
    required String name,
    required Widget page,
    Bindings? binding,
    List<Bindings>? bindings,
    dynamic arguments,
    Transition transition = Transition.fadeIn,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return GetPage(
      name: name,
      page: () => page,
      binding: binding,
      bindings: bindings ?? [],
      transition: transition,
      transitionDuration: transitionDuration,
    );
  }
}
