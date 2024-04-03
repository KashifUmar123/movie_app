import 'package:flutter/material.dart';

extension NumSizeExtension on num {
  SizedBox get heightSpace => SizedBox(
        height: toDouble(),
      );
  SizedBox get widthSpace => SizedBox(
        width: toDouble(),
      );
}
