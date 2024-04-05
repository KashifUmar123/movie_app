import 'package:flutter/material.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/num_extension.dart';
import 'package:movieapp/utils/extensions/size_extension.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.title,
    this.topPadding,
  });
  final String title;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? context.height * .25),
      child: Container(
        width: context.width * .6,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Icon(
                  Icons.hourglass_empty,
                  color: whiteColor,
                  size: 30,
                ),
              ),
            ),
            30.heightSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.label18400.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
