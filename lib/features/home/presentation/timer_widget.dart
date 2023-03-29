import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/utils.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventTimer extends StatefulWidget {
  const EventTimer({Key? key}) : super(key: key);

  @override
  State<EventTimer> createState() => _EventTimerState();
}

class _EventTimerState extends State<EventTimer>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller = CustomTimerController(
    vsync: this,
    begin: eventDate,
    end: const Duration(days: 0, hours: 0, minutes: 0, seconds: 0),
  );

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
      controller: _controller,
      builder: (state, time) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return Text(
                  "Starting In:",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: state.themeMode == ThemeMode.light
                        ? GCCDColor.white
                        : GCCDColor.blueTimer,
                  ),
                );
              },
            ),

            Padding(
              padding: EdgeInsets.only(top: screenWidth! * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeWidget(
                    time: time.days.toString(),
                    placeholder: " d",
                  ),
                  TimeWidget(
                    time: time.hours.toString(),
                    placeholder: " h",
                  ),
                  TimeWidget(
                    time: time.minutes.toString(),
                    placeholder: " m",
                  ),
                  TimeWidget(
                    time: time.seconds.toString(),
                    placeholder: " s",
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class TimeWidget extends StatelessWidget {
  final String time;
  final String placeholder;

  const TimeWidget({required this.time, required this.placeholder, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: screenWidth! * 0.18,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: time,
                  style: textTheme.displaySmall?.copyWith(
                    fontSize: screenWidth! * 0.08,
                    color: state.themeMode == ThemeMode.light
                        ? GCCDColor.white
                        : GCCDColor.blueTimer
                  ),
                ),
                TextSpan(
                  text: placeholder,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: screenWidth! * 0.05,
                    color: state.themeMode == ThemeMode.light
                        ? GCCDColor.white
                        : GCCDColor.blueTimer
                  ),
                ),
              ],
            ),
          );
        },
      ),


    );
  }
}
