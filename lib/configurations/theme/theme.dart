import 'typography.dart';
import 'package:flutter/material.dart';

export 'typography.dart';
export 'ccd_asset.dart';
export 'ccd_colors.dart';
export 'ccd_icons.dart';

class AppTheme {
  static ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextStyle.textTheme,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF9F9F9),
        ),
      ),
      labelStyle: TextStyle(
        color: Color(0xFFF1F1F1),
      ),
    ),
  );
}
