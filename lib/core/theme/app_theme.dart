import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundBlack,
      fontFamily: 'Arial',
      useMaterial3: false,
    );
  }
}
