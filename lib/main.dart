import 'package:ccd2023/app_builder.dart';
import 'package:ccd2023/features/app/ccd_app_runner.dart';
import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/utils/ccd_app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:ccd2023/screens/login/login.dart';

void main() {
  CCDAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');

      ///Can be used to log error to online error reporting libraries

      ///Show error to user
      CCDAppSnackBar.showError(
        exception.toString(),
      );
    },
    rootWidgetBuilder: (appBuilder) async {
      // Initialize project specific initializations here

      // await Firebase.initializeApp(
      //   options: DefaultFirebaseOptions.currentPlatform,
      // );

      // initialize router
      final router = AppRouter();

      return appBuilder(
        CCDAppBuilder(
          appRouter: router,
        ),
      );
    },
  );
}

class CCDApp extends StatelessWidget {
  const CCDApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

      /// TODO: Configure Auto Router

      home: LoginScreen(),
    );
  }
}
