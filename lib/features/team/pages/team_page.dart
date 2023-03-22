import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/app/presentation/navigation/appbar.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer.dart';
import 'package:ccd2023/features/team/bloc/team_bloc.dart';
import 'package:ccd2023/features/team/model/team_model.dart';
import 'package:ccd2023/features/team/pages/team_card.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final TeamBloc _teamBloc = TeamBloc();

  @override
  Widget build(BuildContext context) {
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
              // SizedBox(height: screenHeight! * 0.04),
              // TeamCard(),
              FutureBuilder<List<Team>>(
                  future: _teamBloc.getTeam(0),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Team> team = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: team.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: screenWidth! * 0.08),
                              child: Text(
                                team[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                      color: GCCDColor.googleBlue,
                                    ),
                              ),
                            ),
                            const Divider(),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: team[index].teamMembers.length,
                              itemBuilder: (ctx, ind) {
                                TeamMember teamMember =
                                    team[index].teamMembers[ind];
                                return TeamCard(teamMember: teamMember);
                              },
                            ),
                            // const Divider(),
                          ]);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Connect to the Internet"),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(100),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }),
              SizedBox(height: screenHeight! * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}
