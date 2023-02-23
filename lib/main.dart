
import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/screens/login/login.dart';
import 'package:ccd2023/utils/size_config.dart';
import 'package:ccd2023/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CCDApp());
}

class CCDApp extends StatelessWidget {
  CCDApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp.router(
          title: 'CCD 2023',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      });
    });
  }
}
