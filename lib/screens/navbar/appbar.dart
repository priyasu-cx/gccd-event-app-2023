import 'package:ccd2023/configurations/configurations.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CCDAppBar extends StatelessWidget {
  const CCDAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(left: screenWidth! * 0.04),
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              size: screenWidth! * 0.09,
            ),
          ),
        );
      }),
      title: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              state.themeMode == ThemeMode.light ? Colors.black : Colors.white,
              BlendMode.srcIn,
            ),
            child: Image.asset(
              GCCDImageAssets.gdgCloudKolkataLogo,
              width: screenWidth! * 0.54,
            ),
          );
        },
      ),
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: screenWidth! * 0.05),
      //     child: ProfileButtonWidget(color: color),
      //   ),
      // ],
    );
  }
}
