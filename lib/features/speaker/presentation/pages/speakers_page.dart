import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/speaker/bloc/speaker_cubit.dart';
import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';
import 'package:ccd2023/features/speaker/presentation/pages/speaker_socials.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'multiborder_image.dart';

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
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<SpeakerCubit, SpeakerState>(
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
                  loaded: (List<SpeakerModel> speakers) {
                    if (speakers.isEmpty) {
                      return const Center(
                        child: Text("Speakers Announcing Soon"),
                      );
                    } else {
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: speakers.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20,
                                      horizontal: screenWidth! * 0.08),
                                  child: Text(
                                    speakers[index].title!,
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
                                  itemCount: speakers[index].speakers!.length,
                                  itemBuilder: (
                                    context,
                                    int count,
                                  ) {
                                    return GestureDetector(
                                      onTap: () => {
                                        context.router.push(
                                          SpeakerDetailsRoute(
                                            speaker: speakers[index]
                                                .speakers![count]!,
                                          ),
                                        )
                                      },
                                      child: SpeakerCard(
                                        speaker:
                                            speakers[index].speakers![count]!,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: screenWidth! * 0.06,
                                )
                              ],
                            );
                          });
                    }
                  },
                  error: (message) =>
                      const Center(child: Text("Connect to Internet")),
                );
              },
            ),
          )),
    );
  }
}

class SpeakerCard extends StatefulWidget {
  const SpeakerCard({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  final Speaker? speaker;

  @override
  State<SpeakerCard> createState() => _SpeakerCardState();
}

class _SpeakerCardState extends State<SpeakerCard> {
  bool isAnimationCompleted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() => isAnimationCompleted = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.08, vertical: screenHeight! * 0.01),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MultiBorderImage(
            imageUrl:
                'https://gdgcloud.kolkata.dev/${widget.speaker!.profilePicture!}',
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      widget.speaker!.fullName!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AnimatedContainer(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: GCCDColor.googleBlue,
                      ),
                      duration: const Duration(
                        milliseconds: 700,
                      ),
                      width: !isAnimationCompleted ? 0 : screenWidth! * 0.25,
                      height: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.speaker!.tagLine!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                SpeakerSocialIcons(
                  speaker: widget.speaker!,
                  alignment: "left",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
