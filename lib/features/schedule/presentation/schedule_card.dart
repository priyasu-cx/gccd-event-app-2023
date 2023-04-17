import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
import 'package:ccd2023/features/schedule/presentation/session_widget.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
    required this.rooms,
  }) : super(key: key);

  final List<Room>? rooms;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth! * 0.08, vertical: 10),
            child: Container(
              width: screenWidth!,
              constraints: BoxConstraints(
                minHeight: screenHeight! * 0.15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(5, 5), // changes position of shadow
                  ),
                ],
                border: Border.all(
                  color: Colors.white54,
                  width: 0.2,
                ),
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 30, horizontal: screenWidth! * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            DateFormat("HH:mm")
                                .format(rooms![0].session!.startsAt!),
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.normal)),
                        Text(
                            DateFormat("HH:mm")
                                .format(rooms![0].session!.endsAt!),
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.titleSmall),
                        Text("GMT(+05:30)",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 9)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Divider(),
                            ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rooms!.length,
                        itemBuilder: (context, index) {
                          return SessionWidget(
                            session: rooms![index].session,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
