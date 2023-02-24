import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/utils/ccd_app_snackbar.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:ccd2023/utils/theme.dart';
import 'package:flutter/material.dart';

class CCDAppBuilder extends StatelessWidget {
  const CCDAppBuilder({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp.router(
          title: 'CCD 2023',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: CCDAppSnackBar.scaffoldMessengerKey,
          theme: AppTheme.light,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
        );
      });
    });
  }
}
