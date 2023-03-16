import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/features/app/presentation/navigation/drawer_list_tile.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CCDDrawer extends StatelessWidget {
  const CCDDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().state.user;

    final appCubit = context.read<AppCubit>();

    final themeMode = context.watch<AppCubit>().state.themeMode;

    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AppCubit, AppState>(builder: (context, state) {
                  return ColorFiltered(
                    colorFilter: state.themeMode == ThemeMode.light
                        ? ColorFilter.mode(
                            Colors.transparent, BlendMode.saturation)
                        : ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    child: Image.asset(
                      GCCDImageAssets.gdgCloudKolkataLogo,
                      width: screenWidth! * 0.6,
                    ),
                  );
                }),
                // ColorFiltered(
                //   colorFilter: ,
                //   child: Image.asset(
                //     GCCDImageAssets.gdgCloudKolkataLogo,
                //     width: screenWidth! * 0.6,
                //   ),
                // ),

                const SizedBox(
                  height: kPadding * 3,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: screenWidth! * 0.09,
                      foregroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: screenWidth! * 0.08,
                        child: Image.asset('assets/yoda.png'),
                      ),
                    ),
                    const SizedBox(
                      width: kPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi, ${user?.firstName ?? 'Anonymous Jedi'}'),
                        Text('@ ${user?.username ?? 'Grogu'}'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: drawerItemsMain.length,
            itemBuilder: (context, index) {
              bool isSelected =
                  context.router.currentPath == drawerItemsMainPath[index];

              if (drawerItemsMain[index] == 'Profile' && user == null) {
                return const SizedBox.shrink();
              } else {
                return Padding(
                  padding: EdgeInsets.all(isSelected ? 8.0 : 0),
                  child: DrawerListTile(
                    selected: isSelected,
                    title: drawerItemsMain[index],
                    icon: isSelected
                        ? drawerItemsMainIcon[index]
                        : drawerItemsMainIconOutlined[index],
                    onTap: () {
                      context.router.pushNamed(drawerItemsMainPath[index]);
                    },
                  ),
                );
              }
            },
          ),
          DrawerListTile(
            title: 'Sign ${user == null ? 'In' : 'Out'}',
            icon: user == null ? Icons.login : Icons.logout,
            onTap: () {
              if (user != null) {
                AuthCubit.instance.logout();
              } else {
                context.router.push(const LoginRoute());
              }
            },
          ),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return SwitchListTile.adaptive(
                value: state.themeMode != ThemeMode.light,
                onChanged: (value) {
                  if (!value) {
                    appCubit.updateThemeMode(ThemeMode.light);
                  } else {
                    appCubit.updateThemeMode(ThemeMode.dark);
                  }
                },
                title: Text(
                  state.themeMode == ThemeMode.light
                      ? "Light theme"
                      : "Dark Theme",
                ),
              );
            },
          ),
          Divider(),
          ListView.builder(
            shrinkWrap: true,
            itemCount: drawerItemsFooter.length,
            itemBuilder: (context, index) {
              bool isSelected =
                  context.router.currentPath == drawerItemsFooterPath[index];

              return Padding(
                padding: EdgeInsets.all(isSelected ? 8.0 : 0),
                child: DrawerListTile(
                  selected: isSelected,
                  title: drawerItemsFooter[index],
                  icon: isSelected
                      ? drawerItemsFooterIcon[index]
                      : drawerItemsFooterIconOutlined[index],
                  onTap: () {
                    context.router.pushNamed(drawerItemsFooterPath[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
