import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal:screenWidth! * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SPONSORS',
            style: TextStyle(
              fontSize: screenWidth! * 0.14,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = themeMode == ThemeMode.light ?
                Colors.black : Colors.white,
              // fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.04),
            child: Text(
              sponsorDesc,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
            child: Text(
              "TITLE SPONSOR",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Column(
            children: titleSponsor.map(
              (Map<String, dynamic> sponsor) => Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
                child: SponsorCard(
                  imageUrl: sponsor['logo'],
                  url: sponsor['link'],
                ),
              )
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  const SponsorCard({
    required this.imageUrl,
    required this.url,
    Key? key
  }) : super(key: key);

  final String imageUrl;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchExternalUrl(url);
      },
      child: Container(
        width: screenWidth! * 0.8,
        padding: EdgeInsets.all(15),
        // color: Colors.white,
        decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: GCCDColor.googleRed,
              width: 4,
            ),
            bottom: BorderSide(
              color: GCCDColor.googleYellow,
              width: 4,
            ),
            left: BorderSide(
              color: GCCDColor.googleGreen,
              width: 4,
            ),
            right: BorderSide(
              color: GCCDColor.googleBlue,
              width: 4,
            ),
          ),
        ),
        child: SvgPicture.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

