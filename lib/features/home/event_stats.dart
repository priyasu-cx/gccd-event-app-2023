import 'package:ccd2023/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventStats extends StatelessWidget {
  const EventStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kPadding * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: statData
            .map((e) => StatWidget(title: e['title']!, value: e['value']!))
            .toList(),
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
    return Padding(
      padding: const EdgeInsets.all(
        kPadding * 3,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1
                      ..color = themeMode == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                  ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    // color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
