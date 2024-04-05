import 'package:flutter/material.dart';
import 'package:movieapp/utils/constants/app_colors.dart';
import 'package:movieapp/utils/extensions/styles_extension.dart';
import 'package:shimmer/shimmer.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit,
    this.errorTextStyle,
  });
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final TextStyle? errorTextStyle;

  @override
  Widget build(BuildContext context) {
    return _buildImage(context);
  }

  bool _isNetworkImage(String imagePath) {
    return imagePath.startsWith("http");
  }

  _buildImage(BuildContext context) {
    return _isNetworkImage(path)
        ? Image.network(
            path,
            width: width,
            height: height,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: width,
                  height: height,
                  color: Colors.grey,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: width,
                height: height,
                color: greyColor,
                child: Center(
                  child: Text(
                    "Sorry, image not found",
                    style: errorTextStyle ??
                        context.label16400.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ),
              );
            },
          )
        : Image.asset(
            path,
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: width,
                height: height,
                color: greyColor,
                child: Center(
                  child: Text(
                    "Sorry, image not found",
                    style: errorTextStyle ??
                        context.label16400.copyWith(
                          color: whiteColor,
                        ),
                  ),
                ),
              );
            },
          );
  }
}
