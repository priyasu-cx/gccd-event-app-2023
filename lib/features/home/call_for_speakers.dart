
import 'package:auto_route/auto_route.dart';
import 'package:ccd2023/configurations/constants.dart';
import 'package:ccd2023/configurations/router/ccd_router.gr.dart';
import 'package:ccd2023/configurations/theme/ccd_asset.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';

import 'package:ccd2023/configurations/configurations.dart';

import 'package:ccd2023/features/home/presentation/default_button_widget.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CFPSection extends StatelessWidget {
  const CFPSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;
    final user = context.watch<AuthCubit>().state.user;

    return Container(
      color: themeMode == ThemeMode.light ? Colors.black : Colors.white,
      width: screenWidth,
      height: screenHeight! * 0.45,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            child: SvgPicture.asset(
              GCCDImageAssets.victoriaSVGImage,
              width: screenWidth!,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CALL FOR',
                    style: TextStyle(
                      fontSize: screenWidth! * 0.11,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1
                        ..color = themeMode == ThemeMode.light
                            ? Colors.white
                            : Colors.black,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'SPEAKERS',
                    style: TextStyle(
                      fontSize: screenWidth! * 0.11,
                      color: themeMode == ThemeMode.light
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.04),
                    child: Text(
                      cfpDesc,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: themeMode == ThemeMode.light
                                ? Colors.white
                                : Colors.black,
                          ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth! * 0.6,
                    child:
                    user == null ?
                    DefaultButton(
                      text: "Login to Apply",
                      backgroundColor: GCCDColor.googleRed,
                      foregroundColor: GCCDColor.white,
                      onPressed: () => context.router.push(const LoginRoute()),
                    ) :
                    DefaultButton(
                      text: "Apply to be a Speaker",
                      backgroundColor: GCCDColor.googleRed,
                      foregroundColor: GCCDColor.white,
                      onPressed: () => context.router.push(const CFSRoute()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
