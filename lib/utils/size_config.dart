import 'package:flutter/material.dart';

double? screenWidth;
double? screenHeight;

class SizeConfig {
  static double? _screenWidth;
  static double? _screenHeight;

  static final SizeConfig _singleton = SizeConfig._internal();

  factory SizeConfig() {
    return _singleton;
  }

  SizeConfig._internal();

  void init(BoxConstraints boxConstraints, Orientation orientation) {

    _screenWidth = boxConstraints.maxWidth;
    _screenHeight = boxConstraints.maxHeight;


    screenWidth = _screenWidth ?? 430;
    screenHeight = _screenHeight ?? 932;
  }
}