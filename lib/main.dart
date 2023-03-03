import 'package:ccd2023/ccd_app_builder.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';

import 'configurations/configurations.dart';

Future<void> main() async {
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');
      // Dispatch exception to error reporters
      // ExeptionFilter.filter(exception); returns: true -> show exception to user or false -> do not show
      DjangoflowAppSnackbar.showError(
        exception.toString(),
      );
    },
    rootWidgetBuilder: (appBuilder) async {
      final router = AppRouter();

      return appBuilder(
        CCDAppBuilder(
          appRouter: router,
        ),
      );
    },
  );
}
