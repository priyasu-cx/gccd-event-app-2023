import 'package:ccd2023/ccd_app_builder.dart';
import 'package:ccd2023/configurations/services/notification_service.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'configurations/configurations.dart';
import 'configurations/router/auth_guard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().initNotification();
  await NotificationService().subscribeToTopic("all");
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');
      // Dispatch exception to error reporters
      // ExceptionFilter.filter(exception); returns: true -> show exception to user or false -> do not show
      if (exception is DioError) {
        Response? r = exception.response;
        if (r == null) {
          return;
        } else if (r.statusCode == 401) {
          ///Maybe token expired
          DjangoflowAppSnackbar.showInfo('Session expired. Please login again');
          AuthCubit.instance.logout();
        }
      }
      DjangoflowAppSnackbar.showError(
        exception.toString(),
      );
    },
    rootWidgetBuilder: (appBuilder) async {
      final router = AppRouter(authGuard: AuthGuard());

      return appBuilder(
        CCDAppBuilder(
          appRouter: router,
        ),
      );
    },
  );
}
