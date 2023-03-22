import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventStats extends StatelessWidget {
  const EventStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(screenWidth! * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: statData.map((e) => StatWidget(title: e['title']!, value: e['value']!)).toList(),
      ),
    );
  }
}

class StatWidget extends StatelessWidget {
  const StatWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
      ),
      children: [
        Container(
          padding: EdgeInsets.only(right: screenWidth! * 0.08),
          alignment: Alignment.centerRight,
          width: screenWidth! * 0.2,
          height: screenWidth! * 0.1,
          child: Text(
            value,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: screenWidth! * 0.1,
              // color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = themeMode == ThemeMode.dark ?
                Colors.white : Colors.black,
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: screenWidth! * 0.2,
          height: screenWidth! * 0.1,
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: screenWidth! * 0.09,
              // color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

