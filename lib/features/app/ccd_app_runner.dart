import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnExceptionCallBack = Function(
    Object exception, StackTrace? stackTrace);
typedef RootWidgetBuilder = FutureOr<Widget> Function(
    StatelessWidget Function(StatelessWidget app) builder);

class CCDAppRunner {
  static Future<void> run({
    required OnExceptionCallBack onException,
    required RootWidgetBuilder rootWidgetBuilder,
  }) async =>
      runZonedGuarded(
        () async {
          WidgetsFlutterBinding.ensureInitialized();
          FlutterError.onError = (details, {bool forceReport = false}) {
            debugPrint('>>> ${details.exception}, ${details.stack}');
            onException(details.exception, details.stack);
          };

          if (!kDebugMode) {
            ErrorWidget.builder = (FlutterErrorDetails error) {
              Zone.current.handleUncaughtError(error.exception, error.stack!);

              return const Offstage();
            };
          }
          runApp(
            await rootWidgetBuilder((appBuilder) => appBuilder),
          );
        },
        (exception, stackTrace) async {
          debugPrint('>>> $exception, $stackTrace');

          onException(exception, stackTrace);
        },
      );
}
