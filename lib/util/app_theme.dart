import 'package:building/util/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = _buildLightAppTheme();
  static ThemeData _buildLightAppTheme() {

    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: CONSTANTS.mainBackgroundColor,

    );
  }
}