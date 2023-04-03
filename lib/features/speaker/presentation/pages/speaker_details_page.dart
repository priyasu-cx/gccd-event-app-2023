import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';
import 'package:ccd2023/features/speaker/presentation/pages/speaker_socials.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import 'multiborder_image.dart';

class SpeakerDetailsPage extends StatelessWidget {
  const SpeakerDetailsPage({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  final Speaker speaker;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 0.07),
          child: const CCDAppBar(),
        ),
        drawer: const CCDDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
          constraints: const BoxConstraints.expand(),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: screenHeight! * 0.03,
              ),
              MultiBorderImage(
                  imageUrl: 'https://gdgcloud.kolkata.dev/${speaker.profilePicture!}',
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  speaker.fullName!,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: screenWidth! * 0.15),
                child: Text(
                  speaker.tagLine!,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SpeakerSocialIcons(
                speaker: speaker,),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: themeMode == ThemeMode.dark ? Colors.white: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                      width: 1,
                    ),
                  ),
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bio",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight! * 0.025,
                            ),
                            ReadMoreText(
                              speaker.bio!,
                              trimLines: 10,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'read more',
                              trimExpandedText: 'collapse',
                              colorClickableText: GCCDColor.googleBlue,
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: themeMode == ThemeMode.dark ? Colors.black : Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: const Divider(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          child: DefaultButton(
                              text: "View Other Speakers",
                              isOutlined: true,
                              onPressed: () {
                                context.router.pop();
                              },
                              backgroundColor: GCCDColor.googleBlue,

                          ),
                        )
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.05,
                        //   child: const Divider(
                        //     color: Colors.black12,
                        //   ),
                        // ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     const Text(
                        //       "Sessions",
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontFamily: 'GoogleSans',
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: MediaQuery.of(context).size.height * 0.025,
                        //     ),
                        //     ListView.builder(
                        //       physics: const BouncingScrollPhysics(),
                        //       shrinkWrap: true,
                        //       itemCount: speaker.length,
                        //       itemBuilder: (context, index) {
                        //         // print(speaker.sessions[index].name);
                        //         return ListTile(
                        //           title: Text(
                        //             speaker.fullName!,
                        //             style: const TextStyle(
                        //               fontSize: 20,
                        //               fontFamily: 'GoogleSans',
                        //               color: Colors.black,
                        //             ),
                        //           ),
                        //         );
                        //       },
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
