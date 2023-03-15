import 'package:ccd2023/configurations/configurations.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends ListTile {
  DrawerListTile({
    super.key,
    IconData? icon,
    required String title,
    super.onTap,
    super.selected,
  }) : super(
          leading: icon != null ? Icon(icon, size: kPadding * 4.5) : null,
          title: Text(title),
        );
}
