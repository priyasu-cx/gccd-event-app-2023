import 'package:ccd2023/features/speaker/data/models/speaker_model.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SpeakerSocialIcons extends StatelessWidget {
  const SpeakerSocialIcons({
    Key? key,
    required this.speaker,
    this.alignment = "center",
  }) : super(key: key);

  final Speaker speaker;
  final String alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: alignment == "center"
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: speaker.links!.map((social) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                launchExternalUrl(social.url!);
              },
              child: social!.title == "Instagram"
                  ? const Icon(
                FontAwesome5.instagram,
              )
                  : social.title == "Twitter"
                  ? const Icon(
                FontAwesome5.twitter,
              )
                  : social.title == "LinkedIn"
                  ? const Icon(
                FontAwesome5.linkedin,
              )
                  : social.title == "GitHub"
                  ? const Icon(
                FontAwesome5.github,
              )
                  : social.title == "Facebook"
                  ? const Icon(
                FontAwesome5.facebook,
              )
                  : const Icon(
                FontAwesome5.globe_asia,
              ),
            ),
          );
        }).toList());
  }
}