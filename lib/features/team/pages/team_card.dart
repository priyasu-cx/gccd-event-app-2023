import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/team/model/team_model.dart';
import 'package:ccd2023/features/team/pages/team_social_icons.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

import '../../app/presentation/gccd_border.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    required this.teamMember,
  }) : super(key: key);

  final TeamMember teamMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.08, vertical: screenHeight! * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: GCCDColor.googleGrey.withOpacity(0.5),
          width: 0.5,
        ),
      ),
      width: screenWidth!,
      height: screenHeight! * 0.4,
      child: GCCDBorder(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: GCCDColor.googleYellow,
              child: CircleAvatar(
                  radius: 77,
                  backgroundImage: teamMember.profilePicture.startsWith("https")
                      ? CachedNetworkImageProvider(teamMember.profilePicture)
                      : CachedNetworkImageProvider(
                          "https://gdgcloud.kolkata.dev${teamMember.profilePicture}")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 1.25,
                vertical: kPadding,
              ),
              child: Text(
                teamMember.fullName,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TeamSocialIcons(teamMember: teamMember),
            ),
          ],
        ),
      ),
    );
  }
}
