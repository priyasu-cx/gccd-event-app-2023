import 'package:ccd2023/router/ccd_router.gr.dart';
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
    // return MaterialApp(
    //   // title: 'CCD 2023',
    //   // debugShowCheckedModeBanner: false,
    //   // theme: ThemeData(
    //   //   // This is the theme of your application.
    //   //   // Try running your application with "flutter run". You'll see the
    //   //   // application has a blue toolbar. Then, without quitting the app, try
    //   //   // changing the primarySwatch below to Colors.green and then invoke
    //   //   // "hot reload" (press "r" in the console where you ran "flutter run",
    //   //   // or simply save your changes to "hot reload" in a Flutter IDE).
    //   //   // Notice that the counter didn't reset back to zero; the application
    //   //   // is not restarted.
    //   //   primarySwatch: Colors.blue,
    //   // ),
    //   // /// TODO: Configure Auto Router
    //   // builder: Navigator.builder(),
    //   // home: LoginScreen(),
    //
    // );
    return MaterialApp.router(
      title: 'CCD 2023',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

