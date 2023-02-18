import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(
      color: Colors.black87,
      // color: Colors.black87,
    ),
  ),
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
