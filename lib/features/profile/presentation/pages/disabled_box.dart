import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:flutter/material.dart';

class DisabledField extends StatelessWidget {
  const DisabledField({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(kPadding * 2),
        border: Border.all(
          color: GCCDColor.googleGrey.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      child: Text(
        text!,
        style:
        Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: GCCDColor.googleGrey,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
