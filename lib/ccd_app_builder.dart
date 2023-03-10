import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configurations/configurations.dart';

class CCDAppBuilder extends AppBuilder {
  CCDAppBuilder({
    super.key,
    super.onDispose,
    required AppRouter appRouter,
    final String? initialDeepLink,
  }) : super(
          onInitState: (context) {},
          repositoryProviders: [
            ///Add repositories that are required globally here
            RepositoryProvider<DioApiClient>(
              create: (context) => DioApiClient(
                baseUrl: baseURI,
                client: Dio(),
              ),
            ),
            RepositoryProvider<AuthenticationRepository>(
              create: (context) => AuthenticationRepository(
                context.read<DioApiClient>(),
              ),
            ),
            RepositoryProvider<SizeRepository>(
              create: (context) => SizeRepository(),
            ),
          ],
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit.instance,
            ),
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit.instance
                ..initialize(
                  context.read<AuthenticationRepository>(),
                ),
            ),
          ],
          builder: (context) => AppCubitConsumer(
            listenWhen: (previous, current) =>
                previous.environment != current.environment,
            listener: (context, state) async {},
            builder: (context, appState) => LayoutBuilder(
              builder: (context, constraints) {
                return OrientationBuilder(
                  builder: (context, orientation) {
                    context
                        .read<SizeRepository>()
                        .init(constraints, orientation);
                    // SizeConfig().init(constraints, orientation);
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      scaffoldMessengerKey:
                          DjangoflowAppSnackbar.scaffoldMessengerKey,
                      title: appTitle,
                      theme: AppTheme.light,
                      darkTheme: AppTheme.dark,
                      themeMode: appState.themeMode,
                      locale: Locale(appState.locale, ''),
                      supportedLocales: const [
                        Locale('en', ''),
                      ],
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      routerDelegate: appRouter.delegate(),
                      routeInformationParser: appRouter.defaultRouteParser(),
                    );
                  },
                );
              },
            ),
          ),
        );
}
