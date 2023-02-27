import 'package:ccd2023/screens/data/home_screen_data.dart';
import 'package:ccd2023/utils/ccd_colors.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About GCCD',
            style: TextStyle(
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
                fontStyle: FontStyle.normal,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ]
    );
  }
}
