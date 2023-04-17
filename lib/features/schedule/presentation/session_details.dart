import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/schedule/data/models/schedule_model.dart';
import 'package:ccd2023/features/speaker/presentation/pages/multiborder_image.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class SessionDetails extends StatelessWidget {
  const SessionDetails({Key? key, required this.session}) : super(key: key);

  final Session? session;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      title: Text(
        session!.title!,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      contentPadding: const EdgeInsets.all(15),
      content: Container(
        constraints: BoxConstraints(
          maxHeight: screenHeight! * 0.5,
          minHeight: screenHeight! * 0.3,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ReadMoreText(
                  session!.description!,
                  trimLines: 10,
                  colorClickableText: GCCDColor.googleBlue,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: ' Show less',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  context.router.push(SpeakersRoute());
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Speaker",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                      MultiBorderImage(
                          imageUrl:
                              "https://gdgcloud.kolkata.dev/${session!.speakers![0].profilePicture!}"),
                      Text(
                        session!.speakers![0].name!,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
