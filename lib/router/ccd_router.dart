import 'package:auto_route/annotations.dart';
import 'package:ccd2023/screens/home/home.dart';
import 'package:ccd2023/screens/login/login.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(
    page: HomeScreen,
  ),
  AutoRoute(page: LoginScreen, initial: true),
])
class $AppRouter {}
