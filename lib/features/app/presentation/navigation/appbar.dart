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
      title: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          // return ColorFiltered(
          //   colorFilter:  state.themeMode == ThemeMode.light
          //         ? const ColorFilter.mode(Colors.transparent, BlendMode.saturation)
          //         : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          //   child: Image.asset(
          //     GCCDImageAssets.gdgCloudKolkataLogo,
          //     width: screenWidth! * 0.54,
          //   ),
          // );
          return Image.asset(
            GCCDImageAssets.gdgCloudKolkataLogo,
            width: screenWidth! * 0.54,
          );
        },
      ),
    );
  }
}
