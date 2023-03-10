import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:ccd2023/screens/data/home_screen_data.dart';

class EventTimer extends StatefulWidget {
  const EventTimer({Key? key}) : super(key: key);

  @override
  State<EventTimer> createState() => _EventTimerState();
}

class _EventTimerState extends State<EventTimer> with SingleTickerProviderStateMixin {

  late final CustomTimerController _controller = CustomTimerController(
      vsync: this,
      begin: HomeScreenData.eventDate,
      end: const Duration(days: 0, hours: 0, minutes: 0, seconds: 0),
      // initialState: CustomTimerState.reset,
      // interval: CustomTimerInterval.milliseconds
  );

  @override
  void initState() {
    super.initState();
    _controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: _controller,
        builder: (state, time) {
          // Build the widget you want!🎉
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Starting In:", style: TextStyle(
                color: GCCDColor.blueTimer,
                fontSize: screenWidth! * 0.05,
                fontWeight: FontWeight.w400,
              ),),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: screenWidth! * 0.2,
                      child: TimeWidget(
                        time: time.days.toString(),
                        placeholder: " d",
                      ),
                    ),
                    SizedBox(
                      width: screenWidth! * 0.2,
                      child: TimeWidget(
                        time: time.hours.toString(),
                        placeholder: " h",
                      ),
                    ),
                    SizedBox(
                      width: screenWidth! * 0.2,
                      child: TimeWidget(
                        time: time.minutes.toString(),
                        placeholder: " m",
                      ),
                    ),
                    SizedBox(
                      width: screenWidth! * 0.2,
                      child: TimeWidget(
                        time: time.seconds.toString(),
                        placeholder: " s",
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }
    );
  }
}

class TimeWidget extends StatelessWidget {
  final String time;
  final String placeholder;

  const TimeWidget({
    required this.time,
    required this.placeholder,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
              text: time,
              style: TextStyle(
                color: GCCDColor.blueTimer,
                fontSize: screenWidth! * 0.11,
                fontWeight: FontWeight.w400,
              )),
          TextSpan(
            text: placeholder,
            style: TextStyle(
              color: GCCDColor.blueTimer,
              fontSize: screenWidth! * 0.06,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}


