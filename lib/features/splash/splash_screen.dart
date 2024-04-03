import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Movie App",
            style: context.label26700,
          ),
        ],
      ),
    );
  }
}
