import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/features/home/presentation/partners/pages/community_partners.dart';
import 'package:ccd2023/features/speaker/bloc/cfs_cubit.dart';
import 'package:ccd2023/features/tickets/bloc/ticket_cubit.dart';
import 'package:ccd2023/utils/launch_url.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../event_stats.dart';
import '../../taglines.dart';

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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth! * 0.05),
                        child: BlocBuilder<AppCubit, AppState>(
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth! * 0.05,
                                bottom: screenWidth! * 0.02,
                              ),
                              child: ColorFiltered(
                                colorFilter: state.themeMode == ThemeMode.light
                                    ? const ColorFilter.mode(
                                        Colors.transparent,
                                        BlendMode.saturation,
                                      )
                                    : const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                child: Image.asset(
                                  GCCDImageAssets.googleCloudLogo,
                                  width: screenWidth! * 0.58,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Text(
                        eventTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: screenWidth! * 0.1,
                            ),
                      ),
                      SizedBox(height: screenWidth! * 0.06),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: eventHashTag,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
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
                        'Date : $eventDateStr',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: themeMode == ThemeMode.light
                                  ? GCCDColor.googleBlue
                                  : GCCDColor.googleYellow,
                            ),
                      ),
                      SizedBox(height: screenWidth! * 0.02),
                      RichText(
                        text: TextSpan(
                          text: 'Venue : ',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: themeMode == ThemeMode.light
                                        ? GCCDColor.googleBlue
                                        : GCCDColor.googleYellow,
                                  ),
                          children: [
                            TextSpan(
                              text: ' $eventVenue 🔗',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: themeMode == ThemeMode.light
                                        ? GCCDColor.googleBlue
                                        : GCCDColor.googleYellow,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap =
                                    () => launchExternalUrl(eventVenueUrl),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth! * 0.05),
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth! * 0.03,
                                    vertical: screenHeight! * 0.045),
                                child: const EventTimer(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: screenWidth! * 0.02,
                        ),
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, authState) {
                            if (authState.user == null) {
                              return DefaultButton(
                                isOutlined: true,
                                text: 'Get Started',
                                foregroundColor: GCCDColor.white,
                                backgroundColor: GCCDColor.googleBlue,
                                onPressed: () => context.router.push(
                                  const LoginRoute(),
                                ),
                              );
                            } else {
                              return BlocBuilder<TicketCubit, TicketState>(
                                  builder: (context, ticketState) {
                                return BlocBuilder<CFSCubit, CFSState>(
                                    builder: (context, cfsState) {
                                  if (ticketState.isLoading ||
                                      cfsState.loading) {
                                    return const Padding(
                                      padding: EdgeInsets.all(kPadding),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    bool hasTickets = ticketState.hasTickets;
                                    return Column(
                                      children: [
                                        DefaultButton(
                                          isOutlined: true,
                                          onPressed: () => !hasTickets
                                              ? context.router.push(
                                                  const BuyTicketRoute(),
                                                )
                                              : context.router.push(
                                                  ViewTicketRoute(
                                                    ticket: ticketState.ticket!,
                                                  ),
                                                ),
                                          text: !hasTickets
                                              ? 'Buy ticket'
                                              : 'View Ticket',
                                        ),
                                        DefaultButton(
                                            isOutlined: true,
                                            text: "CFS Closed",
                                            backgroundColor:
                                                GCCDColor.googleRed,
                                            foregroundColor: GCCDColor.white,
                                            onPressed: () {}
                                            // cfsState.talks.isEmpty
                                            //     ? context.router.push(
                                            //         CFSRouterRoute(
                                            //           children: [
                                            //             CFSRoute(),
                                            //           ],
                                            //         ),
                                            //       )
                                            //     : context.router.push(
                                            //         const CFSRouterRoute(
                                            //           children: [
                                            //             TalkListRoute(),
                                            //           ],
                                            //         ),
                                            //       ),
                                            ),
                                      ],
                                    );
                                  }
                                });
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth! * 0.06),
                        child: const AboutSection(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth! * 0.04),
                        child: const CommunityLinks(),
                      ),
                      SizedBox(height: screenWidth! * 0.06),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.04),
                child: const Taglines(),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.04),
                child: const EventStats(),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.04),
                child: const CFPSection(),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.04),
                child: const Sponsors(),
              ),
              SizedBox(height: screenWidth! * 0.1),
              const Divider(),
              // SizedBox(height: screenWidth! * 0.06),
              // BlocBuilder<PartnersCubit, PartnersState>(
              //     builder: (context, state) {
              //       if (state is PartnersLoaded) {
              //         return Padding(
              //           padding: EdgeInsets.only(top: screenWidth! * 0.04),
              //           child: const CommunityPartners(),
              //         );
              //       } else {
              //         return const SizedBox();
              //       }
              //     }
              // ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth! * 0.04),
                child: const CommunityPartners(),
              ),
              SizedBox(height: screenWidth! * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
