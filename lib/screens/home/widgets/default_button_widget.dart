import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/screens/login/login.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Future route;

  const DefaultButton({
    Key? key, required this.text, required this.color, required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight! * 0.01),
      child: SizedBox(
        width: screenWidth!,
        height: screenHeight! * 0.06,
        child: ElevatedButton(
          onPressed: () {
            context.router.replace(LoginRoute());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth! * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}

