import 'package:auto_route/annotations.dart';
import 'package:ccd2023/screens/home/home.dart';
import 'package:ccd2023/screens/login/login.dart';

export 'package:auto_route/auto_route.dart';
export 'ccd_router.gr.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(page: HomeScreen, initial: true, path: "/home"),
  AutoRoute(page: LoginScreen, path: "/login"),
])
class $AppRouter {}
