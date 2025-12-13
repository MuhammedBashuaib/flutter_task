import 'package:flutter/material.dart';

class AppColor {
  // Primary Colors
  static const Color primaryColor = Color(0xFFec441e);
  static const Color primaryDarkColor = Color(
    0xFFc63919,
  ); // A slightly darker shade of primary for contrast

  // Accent Colors (Based on the common use of Orange in the app)
  static const Color accentColor = Colors.orange;
  static final Color accentDarkColor = Colors.orange[700]!;
  static final Color accentLightColor = Colors.orange[100]!;

  // Neutral Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color red = Colors.red;

  // Grey Shades
  static final Color grey = Colors.grey;
  static final Color grey100 = Colors.grey[100]!; // Background color
  static final Color grey200 = Colors.grey[200]!;
  static final Color grey300 = Colors.grey[300]!;
  static final Color grey500 = Colors.grey[500]!;
  static final Color grey600 = Colors.grey[600]!;
  static final Color grey700 = Colors.grey[700]!;
  static final Color grey800 = Colors.grey[800]!;
}
