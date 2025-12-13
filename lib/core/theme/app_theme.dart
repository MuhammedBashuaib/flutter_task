import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
      useMaterial3: true,
    );
  }
}
