import 'package:ccd2023/screens/data/home_screen_data.dart';
import 'package:ccd2023/utils/ccd_colors.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget aboutSection(){
  return Column(
    children: [
      Text(
        'About GCCD',
        style: TextStyle(
          fontFamily: GoogleFonts.inriaSans().fontFamily,
          fontSize: screenWidth! * 0.11,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1
            ..color = GCCDColor.googleBlue,
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.06),
        child: Text(HomeScreenData.aboutGCCD,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth! * 0.04,
            // fontWeight: FontWeight.w200,
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    ]
  );
}