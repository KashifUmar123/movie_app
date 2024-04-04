import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/utils/constants/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
    this.navigationBar,
    this.drawer,
    this.statusBarColor,
    this.systemNavigationBarColor,
    this.padding,
    this.floatingActionButton,
  });
  final Widget child;
  final Widget? navigationBar;
  final Widget? drawer;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? whiteColor,
        systemNavigationBarColor: systemNavigationBarColor ?? whiteColor,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        drawer: drawer,
        body: SizedBox(
          child: child,
        ),
        bottomNavigationBar: navigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
