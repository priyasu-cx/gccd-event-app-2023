import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

Widget DefaultAppbar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: Builder(builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(left:screenWidth! * 0.04),
        child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: screenWidth! * 0.09,
              color: Colors.white,
            )),
      );
    }),
    title: ColorFiltered(
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      child: Image.asset(
        GCCDImageAssets.gdgCloudKolkataLogo,
        width: screenWidth! * 0.6,
      ),
    ),
    // actions: [
    //   Padding(
    //     padding: EdgeInsets.only(right: screenWidth! * 0.05),
    //     child: ProfileButtonWidget(color: color),
    //   ),
    // ],
  );
}