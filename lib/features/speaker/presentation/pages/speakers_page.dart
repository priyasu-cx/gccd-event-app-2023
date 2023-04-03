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
                      child: SpeakerCard(speaker: speakers.speakers![0]),
                    );
                  }
                },
                error: (message) => Center(child: Text("Connect to Internet")),
              );
            },
          )),
    );
  }
}

class SpeakerCard extends StatelessWidget {
  const SpeakerCard({
    Key? key,
    required this.speaker,
  }) : super(key: key);

  final Speaker? speaker;

  @override
  Widget build(BuildContext context) {
    print(speaker);
    return Container();
  }
}

// class SpeakerCard extends StatefulWidget {
//   const SpeakerCard({
//     Key? key,
//     required this.speaker,
//   }) : super(key: key);

//   final Speaker speaker;

//   @override
//   State<SpeakerCard> createState() => _SpeakerCardState();
// }

// class _SpeakerCardState extends State<SpeakerCard> {
//   Icon getSocialLink(Speaker speakerDetails, BuildContext context) {
  //   switch (link.title) {
  //     case "Twitter":
  //       return const Icon(
  //         FontAwesomeIcons.twitter,
  //         color: Color(
  //           0xFF1DA1F2,
  //         ),
  //       );

  //     case "Facebook":
  //       return const Icon(
  //         FontAwesomeIcons.facebook,
  //         color: Color(
  //           0xFF3B5998,
  //         ),
  //       );
  //     case "Github":
  //       return const Icon(
  //         FontAwesomeIcons.github,
  //         color: Color(0xFF333F4D),
  //       );
  //     case "LinkedIn":
  //       return const Icon(
  //         FontAwesomeIcons.linkedin,
  //         color: Color(0xFF0077B5),
  //       );
  //     case "Company Website":
  //       return const Icon(
  //         FontAwesomeIcons.globe,
  //         color: Color(0xFF0077B5),
  //       );
  //     case "Instagram":
  //       return const Icon(
  //         FontAwesomeIcons.instagram,
  //         color: Color(0xFFE4405F),
  //       );
  //     case "Sessionize":
  //       return const Icon(
  //         FontAwesomeIcons.calendar,
  //         color: Color(0xFF1AB394),
  //       );
  //     case "Blog":
  //       return const Icon(
  //         FontAwesomeIcons.blogger,
  //         color: Color(0xFFF57C00),
  //       );
  //     default:
  //       return const Icon(Icons.link);
  //   }
  // }

//   Widget getSocialLinks(BuildContext context) {
//     if (widget.socialLinks.isEmpty) {
//       return Container();
//     }
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: widget.socialLinks.map((link) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//             child: InkWell(
//               onTap: () {
//                 launchUrlString(
//                   link.url,
//                   mode: LaunchMode.externalApplication,
//                 );
//               },
//               child: getSocialLink(link, context),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   bool isAnimationCompleted = false;

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       setState(() => isAnimationCompleted = true);
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0.0,
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Hero(
//               tag: widget.id,
//               child: MultiBorderImage(
//                 imageUrl: widget.profilePicture,
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Text(
//                         widget.name,
//                         style: const TextStyle(
//                           fontFamily: "GoogleSans",
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       AnimatedContainer(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Tools.multiColors[Random().nextInt(4)],
//                         ),
//                         duration: const Duration(
//                           milliseconds: 700,
//                         ),
//                         width: !isAnimationCompleted
//                             ? 0
//                             : MediaQuery.of(context).size.width * 0.2,
//                         height: 5,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     widget.tagLine,
//                     style: const TextStyle(
//                       fontFamily: "GoogleSans",
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   getSocialLinks(context),
//                   // socialActions(context, ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
