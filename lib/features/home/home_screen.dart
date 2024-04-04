import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/features/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Column(
        children: [],
      ),
    );
  }
}
