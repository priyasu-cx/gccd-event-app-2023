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

    return Drawer(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  GCCDImageAssets.gdgCloudKolkataLogo,
                  width: screenWidth! * 0.6,
                ),
                const SizedBox(
                  height: kPadding * 4,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset('assets/yoda.png'),
                    ),
                    const SizedBox(
                      width: kPadding,
                    ),
                    Text('Hi, ${user?.username ?? 'Anonymous Jedi'}'),
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: drawerItemsMain.length,
            itemBuilder: (context, index) {
              bool isSelected =
                  context.router.currentPath == drawerItemsMainPath[index];

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
            },
          ),
          DrawerListTile(
            title: 'Sign ${user == null ? 'In' : 'Out'}',
            icon: Icons.logout,
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
        ],
      ),
    );
  }
}
