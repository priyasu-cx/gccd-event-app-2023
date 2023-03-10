import 'package:flutter/material.dart';

double? screenWidth;
double? screenHeight;

class SizeRepository {
  static double? _screenWidth;
  static double? _screenHeight;

  void init(BoxConstraints boxConstraints, Orientation orientation) {
    _screenWidth = boxConstraints.maxWidth;
    _screenHeight = boxConstraints.maxHeight;

    screenWidth = _screenWidth ?? 430;
    screenHeight = _screenHeight ?? 932;
  }
}
