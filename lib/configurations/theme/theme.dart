import 'package:ccd2023/configurations/configurations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

export 'typography.dart';
export 'ccd_asset.dart';
export 'ccd_colors.dart';
export 'ccd_icons.dart';

class AppTheme {
  static ListTileThemeData listTileThemeData = ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ThemeData light = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: GCCDColor.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: GCCDColor.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: GCCDColor.white,
    ),
    scaffoldBackgroundColor: GCCDColor.white,
    textTheme: AppTextStyle.textTheme.apply(
      bodyColor: GCCDColor.black,
      displayColor: GCCDColor.black,
    ),
    listTileTheme: listTileThemeData.copyWith(
      iconColor: GCCDColor.black,
      selectedTileColor: GCCDColor.black,
      selectedColor: GCCDColor.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFF9F9F9),
        ),
      ),
      fillColor: GCCDColor.white,
      filled: true,
      labelStyle: TextStyle(
        color: Color(0xFFF1F1F1),
      ),
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: GCCDColor.black,
      elevation: 0,
      iconTheme: IconThemeData(
        color: GCCDColor.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: GCCDColor.black,
      )
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: GCCDColor.black,
    ),
    scaffoldBackgroundColor: GCCDColor.black,
    textTheme: AppTextStyle.textTheme.apply(
      bodyColor: GCCDColor.white,
      displayColor: GCCDColor.white,
    ),
    listTileTheme: listTileThemeData.copyWith(
      iconColor: GCCDColor.white,
      selectedTileColor: GCCDColor.white,
      selectedColor: GCCDColor.black,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF1F1E1E),
        ),
      ),
      fillColor: GCCDColor.white,
      filled: true,
      labelStyle: TextStyle(
        color: Color(0xFF1F1E1E),
      ),
    ),
  );
}
