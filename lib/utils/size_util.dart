import 'package:flutter/material.dart';

double? screenWidth;
double? screenHeight;

class SizeRepository {
  static double? _screenWidth;
  static double? _screenHeight;

  static final SizeRepository _singleton = SizeRepository._internal();

  factory SizeRepository() {
    return _singleton;
  }

  SizeRepository._internal();

  void init(BoxConstraints boxConstraints, Orientation orientation) {

    _screenWidth = boxConstraints.maxWidth;
    _screenHeight = boxConstraints.maxHeight;


    screenWidth = _screenWidth ?? 430;
    screenHeight = _screenHeight ?? 932;
  }
}