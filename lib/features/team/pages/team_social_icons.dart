import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/team/model/team_model.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class TeamSocialIcons extends StatelessWidget {
  const TeamSocialIcons({
    Key? key,
    required this.teamMember,
  }) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: teamMember.links.map((social) {
          return Padding(
            padding: const EdgeInsets.all(kPadding),
            child: InkWell(
              onTap: () {
                launchExternalUrl(social['url']);
              },
              child: social['title'] == "Instagram"
                  ? const Icon(
                      FontAwesome5.instagram,
                    )
                  : social['title'] == "Twitter"
                      ? const Icon(
                          FontAwesome5.twitter,
                        )
                      : social['title'] == "LinkedIn"
                          ? const Icon(
                              FontAwesome5.linkedin,
                            )
                          : social['title'] == "GitHub"
                              ? const Icon(
                                  FontAwesome5.github,
                                )
                              : social['title'] == "Facebook"
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
