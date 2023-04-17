import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/schedule/bloc/schedule_cubit.dart';
import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
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
        body: SingleChildScrollView(
          child: BlocBuilder<ScheduleCubit, ScheduleState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => SizedBox(
                  height: screenHeight! * 0.8,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ),
                loaded: (List<Schedule> schedule) {
                  print(schedule);
                  return SizedBox();
                },
                error: (String message) => Center(
                  child: Text(message),
                ),
              );
            },
          )
        )
      ),
    );
  }
}
