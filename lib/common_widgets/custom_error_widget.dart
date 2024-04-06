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
    this.onRetry,
    this.retryText,
  });
  final String title;
  final double? topPadding;
  final VoidCallback? onRetry;
  final String? retryText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 48,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(
                Icons.error,
                color: whiteColor,
                size: 30,
              ),
            ),
          ),
          30.heightSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.label18400.copyWith(fontSize: 20, color: whiteColor),
          ),
          30.heightSpace,
          if (onRetry != null) _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return InkWell(
      onTap: () {
        onRetry?.call();
      },
      child: Container(
        height: 50,
        width: 243,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: blackColor,
        ),
        child: Center(
          child: Text(
            retryText ?? "Retry",
            style: context.label14400.copyWith(
              color: whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
