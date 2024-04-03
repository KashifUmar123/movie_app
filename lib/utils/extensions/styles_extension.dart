import 'package:flutter/material.dart';

extension StylesExtension on BuildContext {
  TextStyle get label12400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label14400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label16400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label18400 => Theme.of(this).textTheme.bodyMedium!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );
  TextStyle get label26700 => Theme.of(this).textTheme.titleLarge!.copyWith(
        fontSize: 26,
        fontWeight: FontWeight.w700,
      );
}
