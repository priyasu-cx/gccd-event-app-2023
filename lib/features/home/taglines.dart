import 'package:ccd2023/configurations/constants.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Taglines extends StatelessWidget {
  const Taglines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(kPadding * 2),
      color: themeMode == ThemeMode.dark ?
      Colors.white : Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tagline1,
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.normal,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1.2
                ..color = themeMode == ThemeMode.dark ?
                    Colors.black : Colors.white,
            ),
          ),
          const SizedBox(height: kPadding * 2),
          Text(
            tagline2,
            textAlign: TextAlign.center,
            style:textTheme.headlineLarge?.copyWith(
              color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
