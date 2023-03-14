import 'package:ccd2023/configurations/theme/ccd_asset.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActivateEmailPage extends StatelessWidget {
  final String title;
  final String message;

  const ActivateEmailPage({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: screenHeight! * 0.1),
                SvgPicture.asset(
                  GCCDImageAssets.victoriaSVGImage,
                  width: screenWidth! * 0.8,
                ),
                SizedBox(height: screenHeight! * 0.08),
                Center(
                  child: Text(message),
                ),
              ],
            ),
          ),
        ));
  }
}
