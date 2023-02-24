import 'package:ccd2023/app_builder.dart';
import 'package:ccd2023/features/app/ccd_app_runner.dart';
import 'package:ccd2023/router/ccd_router.gr.dart';
import 'package:ccd2023/utils/ccd_app_snackbar.dart';
import 'package:flutter/material.dart';

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
