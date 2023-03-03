import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

Widget defaultDrawer() {
  return Drawer(
    child: Container(
      color: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Image.asset(
              GCCDImageAssets.gdgCloudKolkataLogo,
              width: screenWidth! * 0.5,
            ),
          ),
          ListTile(
            title: const Text('Demo Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Demo Item 2'),
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
