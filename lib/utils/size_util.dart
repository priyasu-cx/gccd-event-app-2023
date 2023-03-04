import 'package:flutter/material.dart';

double? screenWidth;
double? screenHeight;

class SizeUtil {
  static double? _screenWidth;
  static double? _screenHeight;

  static final SizeUtil _singleton = SizeUtil._internal();

  factory SizeUtil() {
    return _singleton;
  }

  SizeUtil._internal();

  void init(BoxConstraints boxConstraints, Orientation orientation) {

    _screenWidth = boxConstraints.maxWidth;
    _screenHeight = boxConstraints.maxHeight;


    screenWidth = _screenWidth ?? 430;
    screenHeight = _screenHeight ?? 932;
  }
}