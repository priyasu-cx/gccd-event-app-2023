import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Taglines extends StatelessWidget {
  const Taglines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    return Container(
      padding: EdgeInsets.all(screenWidth! * 0.08),
      color: themeMode == ThemeMode.dark ?
      Colors.white : Colors.black,
      // height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tagline1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth! * 0.075,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.2
                ..color = themeMode == ThemeMode.dark ?
                    Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            tagline2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: screenWidth! * 0.08,
              color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
