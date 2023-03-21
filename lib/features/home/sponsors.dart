import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenWidth! * 0.06),
          Text(
            'SPONSORS',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
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
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
            child: Text(
              "TITLE SPONSOR",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Column(
            children: titleSponsor
                .map((Map<String, dynamic> sponsor) => Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth! * 0.02),
                      child: SponsorCard(
                        imageUrl: sponsor['logo'],
                        url: sponsor['link'],
                      ),
                    ))
                .toList(),
          ),
          SizedBox(height: screenWidth! * 0.04),
          // SizedBox(
          //   width: screenWidth! * 0.5,
          //   child: DefaultButton(
          //     onPressed: () {},
          //     backgroundColor: Colors.transparent,
          //     isOutlined: true,
          //       text: "Become a Sponsor",
          //   ),
          // )
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "To become a sponsor, please email as at ",
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                      text: "partners@gdgcloud.kolkata.dev",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    )
                  ])),
        ],
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  const SponsorCard({required this.imageUrl, required this.url, Key? key})
      : super(key: key);

  final String imageUrl;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchExternalUrl(url);
      },
      child: Container(
        padding: const EdgeInsets.all(kPadding * 2),
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
