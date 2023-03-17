import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:flutter/material.dart';

class CommunityLinks extends StatelessWidget {
  const CommunityLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            launchExternalUrl("https://developers.google.com/community/gdg");
          },
          child: Row(
            children: [
              const Icon(
                Icons.launch,
                color: GCCDColor.googleBlue,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Google Developer Groups",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: GCCDColor.googleBlue),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            launchExternalUrl("https://developers.google.com/womentechmakers");
          },
          child: Row(
            children: [
              const Icon(
                Icons.launch,
                color: GCCDColor.googleBlue,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Women Techmakers",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: GCCDColor.googleBlue),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            launchExternalUrl("https://developers.google.com/community/gdsc");
          },
          child: Row(
            children: [
              const Icon(
                Icons.launch,
                color: GCCDColor.googleBlue,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Google Developer Student Clubs",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: GCCDColor.googleBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
