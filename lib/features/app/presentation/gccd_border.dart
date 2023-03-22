import 'package:ccd2023/configurations/configurations.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_util.dart';

class GCCDBorder extends StatelessWidget {
  const GCCDBorder({Key? key, required this.child}) : super(key: key);

  final Widget child;

  final kBorderWidth = kPadding / 1.5;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.07),
        width: screenWidth!,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: GCCDColor.googleRed,
              width: kBorderWidth,
            ),
            bottom: BorderSide(
              color: GCCDColor.googleYellow,
              width: kBorderWidth,
            ),
            left: BorderSide(
              color: GCCDColor.googleGreen,
              width: kBorderWidth,
            ),
            right: BorderSide(
              color: GCCDColor.googleBlue,
              width: kBorderWidth,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
