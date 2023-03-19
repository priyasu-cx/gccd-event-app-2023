import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';

import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/configurations/configurations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppCubit>().state.themeMode;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight! * 0.07),
          child: const CCDAppBar(),
        ),
        drawer: const CCDDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth! * 0.05),
                  child: BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.only(top: screenWidth! * 0.05, bottom: screenWidth! * 0.02),
                        child: ColorFiltered(
                          colorFilter: state.themeMode == ThemeMode.light
                              ? const ColorFilter.mode(Colors.transparent, BlendMode.saturation)
                              : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          child: Image.asset(
                            GCCDImageAssets.googleCloudLogo,
                            width: screenWidth! * 0.58,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Text(eventTitle, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: screenWidth! * 0.1,
                )),
                SizedBox(height: screenWidth! * 0.06),
                RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: eventHashTag,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: themeMode == ThemeMode.light
                              ? GCCDColor.googleBlue
                              : GCCDColor.googleYellow,
                        ),
                      ),
                      TextSpan(
                        text: eventDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenWidth! * 0.06),
                Text(
                  'Date : $eventDate_copy',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: themeMode == ThemeMode.light
                        ? GCCDColor.googleBlue
                        : GCCDColor.googleYellow,
                  ),
                ),
                SizedBox(height: screenWidth! * 0.02),
                Text(
                  'Venue : $eventVenue',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: themeMode == ThemeMode.light
                        ? GCCDColor.googleBlue
                        : GCCDColor.googleYellow,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenWidth! * 0.05),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        GCCDImageAssets.backgroundGraphics,
                        width: screenWidth!,
                      ),
                      Card(
                        color: (themeMode == ThemeMode.light
                                ? GCCDColor.black
                                : GCCDColor.white)
                            .withOpacity(0.2),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth!*0.07, vertical: screenHeight! * 0.045),
                          child: const EventTimer(),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.user != null) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth! * 0.06),
                        child: Column(
                          children: [
                            DefaultButton(
                              isOutlined: true,
                              onPressed: () => DjangoflowAppSnackbar.showInfo(
                                'Coming Soon',
                              ),
                              text: 'Buy tickets',
                            ),
                            DefaultButton(
                              isOutlined: true,
                              text: "Call for Speakers",
                              backgroundColor: GCCDColor.googleRed,
                              foregroundColor: GCCDColor.white,
                              onPressed: () => context.router.push(CFSRoute()),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return DefaultButton(
                        isOutlined: true,
                        text: 'Get Started',
                        foregroundColor: GCCDColor.white,
                        backgroundColor: GCCDColor.googleBlue,
                        onPressed: () => context.router.push(
                          const LoginRoute(),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth! * 0.06),
                  child: const AboutSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
