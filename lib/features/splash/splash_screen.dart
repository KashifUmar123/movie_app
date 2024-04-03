import 'package:flutter/material.dart';
import 'package:movieapp/common_widgets/custom_scaffold.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          20.heightSpace,
          Center(
            child: Text(
              "Movie App",
              style: context.label26700,
            ),
          ),
          20.heightSpace,
          const CircularProgressIndicator(
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
