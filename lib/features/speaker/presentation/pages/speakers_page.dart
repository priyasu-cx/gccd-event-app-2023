import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/speaker/bloc/speaker_cubit.dart';
import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeakersPage extends StatelessWidget {
  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 0.07),
            child: const CCDAppBar(),
          ),
          drawer: const CCDDrawer(),
          body: BlocBuilder<SpeakerCubit, SpeakerState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: GCCDColor.googleBlue,
                  ),
                ),
                loaded: (SpeakerModel speakers) {
                  if (speakers.speakers == null) {
                    return const Center(
                      child: Text("No Speakers"),
                    );
                  } else {
                    return Center(
                      child: Text('Speakers'),
                    );
                  }
                  ;
                },
                error: (message) => Center(child: Text("Connect to Internet")),
              );
            },
          )),
    );
  }
}
