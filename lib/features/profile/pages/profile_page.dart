import 'package:ccd2023/configurations/theme/ccd_asset.dart';
import 'package:ccd2023/configurations/theme/ccd_colors.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user;

    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight! * 0.07),
            child: const CCDAppBar(),
          ),
          drawer: const CCDDrawer(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth! * 0.08),
              child: Column(
                children: [
                  SvgPicture.asset(
                    GCCDImageAssets.victoriaSVGImage,
                    width: screenWidth!,
                  ),
                  // SizedBox(height: screenWidth! * 0.06),
                  Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: GCCDColor.googleYellow,
                            width: 3,
                          )),
                      width: screenWidth! * 0.2,
                      child: CircleAvatar(
                        radius: screenWidth! * 0.1,
                        child: Image.asset(GCCDImageAssets.yoda),
                      ),
                    ),
                    SizedBox(width: screenWidth! * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Hi, ${user?.profile.firstName ?? 'Anonymous Jedi'}',
                            style: Theme.of(context).textTheme.titleLarge),
                        Text('@ ${user?.username ?? 'Grogu'}',
                            style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ]),
                  SizedBox(height: screenWidth! * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidth! * 0.4,
                          child: DefaultButton(
                              text: 'Buy Tickets',
                              backgroundColor: GCCDColor.googleGreen,
                              withIcon: true,
                              icon: Icons.local_activity_outlined,
                              isOutlined: true,
                              onPressed: () {}
                          )
                      ),
                      SizedBox(
                          width: screenWidth! * 0.4,
                          child: DefaultButton(
                              text: 'Edit Profile',
                              backgroundColor: GCCDColor.googleBlue,
                              withIcon: true,
                              icon: Icons.edit_note_outlined,
                              isOutlined: true,
                              onPressed: () {}
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth! * 0.03),
                  Container(
                    padding: EdgeInsets.all(screenWidth! * 0.02),
                    decoration: BoxDecoration(
                      color: GCCDColor.googleGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Add socials by editing your profile.", style: Theme.of(context).textTheme.bodySmall),
                  ),
                  SizedBox(height: screenWidth! * 0.06),
                  Container(
                    padding: EdgeInsets.all(screenWidth! * 0.03),
                    // height: screenWidth! * 0.3,
                    width: screenWidth!,
                    decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      border: Border(
                        top: BorderSide(
                          color: GCCDColor.googleRed,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: GCCDColor.googleYellow,
                          width: 1,
                        ),
                        left: BorderSide(
                          color: GCCDColor.googleGreen,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: GCCDColor.googleBlue,
                          width: 1,
                        ),
                      ),
                      ),
                    child: Text("Under Development", style: Theme.of(context).textTheme.bodyLarge),
                    ),
                ],
              ),
            ),
          )),
    );
  }
}
