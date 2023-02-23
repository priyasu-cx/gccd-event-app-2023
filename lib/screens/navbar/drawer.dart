import 'package:ccd2023/utils/ccd_asset.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';

Widget defaultDrawer(){
  return Drawer(
    child: Container(
      color: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset(
              GCCDImageAssets.gdgCloudLogo,
              width: screenWidth! * 0.5,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Demo Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Demo Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    ),
  );
}