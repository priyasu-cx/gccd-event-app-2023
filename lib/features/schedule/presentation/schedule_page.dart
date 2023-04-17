import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/configurations/theme/theme.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/schedule/bloc/schedule_cubit.dart';
import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
import 'package:ccd2023/features/schedule/presentation/schedule_card.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 0.07),
            child: const CCDAppBar(),
          ),
          drawer: const CCDDrawer(),
          body: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => SizedBox(
                  height: screenHeight! * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: GCCDColor.googleBlue,
                    ),
                  ),
                ),
                loaded: (List<Schedule> schedule) {
                  // print(schedule);
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: screenWidth! * 0.08),
                          child: Text(
                            "Schedule",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  color: GCCDColor.googleBlue,
                                ),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          width: 20,
                        ),
                        ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: schedule[0].timeSlots!.length,
                            itemBuilder: (context, index) {
                              return ScheduleCard(
                                  rooms: schedule[0].timeSlots![index].rooms);
                            }),
                        SizedBox(
                          height: screenHeight! * 0.06,
                        )
                      ],
                    ),
                  );
                },
                error: (String message) => const Center(
                  child: Text("Connect to the internet"),
                ),
              );
            },
          )),
    );
  }
}
