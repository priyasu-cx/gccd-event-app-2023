import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
import 'package:ccd2023/features/schedule/presentation/session_details.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({
    Key? key,
    required this.session,
  }) : super(key: key);

  final Session? session;

  @override
  Widget build(BuildContext context) {
    Color roomColor, textColor;

    switch (session!.room) {
      case "Cloud Track":
        roomColor = GCCDColor.googleRed;
        textColor = Colors.white;
        break;
      case "ML/AI Track":
        roomColor = GCCDColor.googleGreen;
        textColor = Colors.white;
        break;
      case "Web/Mobile Track":
        roomColor = GCCDColor.googleYellow;
        textColor = Colors.black;
        break;
      case "Community Track":
        roomColor = GCCDColor.googleBlue;
        textColor = Colors.white;
        break;
      case "Career Track":
        roomColor = Colors.white;
        textColor = Colors.black;
        break;
      default:
        roomColor = GCCDColor.googleRed;
        textColor = Colors.white;
    }

    return InkWell(
      onTap: () {
        session!.description == null || session!.description == ""
            ? null
            : showDialog(
                context: context,
                builder: (context) => SessionDetails(session: session),
              );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 4, horizontal: screenWidth! * 0.04),
            decoration: BoxDecoration(
              color: roomColor,

              // GCCDColor.googleYellow,
            ),
            child: Text(
              session!.room!,
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          session!.title! == ""
              ? const Offstage()
              : Text(session!.title!,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(
            height: 10,
          ),
          session!.speakers!.isEmpty
              ? const SizedBox.shrink()
              : Column(
                  children: session!.speakers!
                      .map((speaker) => Container(
                          margin: EdgeInsets.only(bottom: 6),
                          padding: EdgeInsets.symmetric(
                              vertical: 6, horizontal: screenWidth! * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: GCCDColor.googleBlue,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: GCCDColor.googleBlue,
                                child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage: CachedNetworkImageProvider(
                                    "https://gdgcloud.kolkata.dev/${speaker.profilePicture!}",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  speaker.name!,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: GCCDColor.googleBlue),
                                ),
                              ),
                            ],
                          )))
                      .toList(),
                )
          // Container(
          //         padding: EdgeInsets.symmetric(
          //             vertical: 6, horizontal: screenWidth! * 0.02),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(
          //             color: GCCDColor.googleBlue,
          //             width: 0.5,
          //           ),
          //         ),
          //         child: Row(
          //           children: [
          //             CircleAvatar(
          //               radius: 14,
          //               backgroundColor: GCCDColor.googleBlue,
          //               child: CircleAvatar(
          //                 radius: 12,
          //                 backgroundImage: CachedNetworkImageProvider(
          //                   "https://gdgcloud.kolkata.dev/${session!.speakers![0].profilePicture!}",
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 10,
          //             ),
          //             Expanded(
          //               child: Text(
          //                 session!.speakers![0].name!,
          //                 textAlign: TextAlign.left,
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .bodyMedium
          //                     ?.copyWith(color: Colors.white),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
        ],
      ),
    );
  }
}
