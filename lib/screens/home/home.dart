import 'package:ccd2023/screens/data/home_screen_data.dart';
import 'package:ccd2023/screens/home/widgets/about_section_widget.dart';
import 'package:ccd2023/screens/home/widgets/default_button_widget.dart';
import 'package:ccd2023/utils/ccd_asset.dart';
import 'package:ccd2023/utils/ccd_colors.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth! * 0.2),
                        child: Image.asset(
                          GCCDImageAssets.googleCloudLogo,
                          width: screenWidth! * 0.58,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Text(HomeScreenData.eventTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth! * 0.11,
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.inriaSans().fontFamily,
                          )),
                      SizedBox(height: screenWidth! * 0.06),
                      RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(children: [
                        TextSpan(
                            text: HomeScreenData.eventHashTag,
                            style: TextStyle(
                              color: GCCDColor.googleYellow,
                              fontSize: screenWidth! * 0.04,
                              // fontWeight: FontWeight.w200,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontStyle: FontStyle.normal,
                            )),
                        TextSpan(
                            text: HomeScreenData.eventDescription,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth! * 0.04,
                              // fontWeight: FontWeight.w200,
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              fontStyle: FontStyle.normal,
                            ),),
                      ])),

                      /// TODO: Timer

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.1),
                        child: Column(
                          children: [
                            defaultButton("Register Now", GCCDColor.googleBlue),
                            defaultButton("Call for Speakers", GCCDColor.googleGrey),
                          ],
                        ),
                      ),

                      aboutSection(),

                    ]),
              )),
        ));
  }
}


