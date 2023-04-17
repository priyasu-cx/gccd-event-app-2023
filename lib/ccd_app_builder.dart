import 'package:ccd2023/features/app/data/repository/dio/dio_api_client.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/schedule/data/repository/schedule_repo.dart';
import 'package:ccd2023/features/speaker/bloc/speaker_cubit.dart';
import 'package:ccd2023/features/speaker/data/repos/speaker_repo.dart';
import 'package:ccd2023/features/team/bloc/team_cubit.dart';
import 'package:ccd2023/features/team/repo/team_repo.dart';
import 'package:ccd2023/features/tickets/bloc/ticket_cubit.dart';
import 'package:ccd2023/features/tickets/data/ticket_repository.dart';
import 'package:ccd2023/utils/size_util.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configurations/configurations.dart';
import 'features/schedule/bloc/schedule_cubit.dart';
import 'features/speaker/bloc/cfs_cubit.dart';
import 'features/speaker/bloc/technology_cubit.dart';
import 'features/speaker/data/repos/cfs_repo.dart';
import 'features/speaker/data/repos/technology_repo.dart';

class CCDAppBuilder extends AppBuilder {
  CCDAppBuilder({
    super.key,
    super.onDispose,
    required AppRouter appRouter,
    final String? initialDeepLink,
  }) : super(
          onInitState: (context) {
            AppCubit.instance.updateThemeMode(ThemeMode.dark);
          },
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
            RepositoryProvider<TicketRepository>(
              create: (context) => TicketRepository(
                context.read<DioApiClient>(),
              ),
            ),
            RepositoryProvider<SizeRepository>(
              create: (context) => SizeRepository(),
            ),
            RepositoryProvider<CFSRepository>(
              create: (context) => CFSRepository(
                context.read<DioApiClient>(),
              ),
            ),

            RepositoryProvider<TechnologyRepository>(
              create: (context) => TechnologyRepository(
                context.read<DioApiClient>(),
              ),
            ),
            RepositoryProvider<TeamRepository>(
              create: (context) => TeamRepository(
                context.read<DioApiClient>(),
              ),
            ),
            RepositoryProvider<SpeakerRepository>(
              create: (context) => SpeakerRepository(
                context.read<DioApiClient>(),
              ),
            ),
            RepositoryProvider<ScheduleRepository>(
                create: (context) => ScheduleRepository(
                      context.read<DioApiClient>(),
                    ),
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
            BlocProvider<TicketCubit>(
              create: (context) => TicketCubit(
                context.read<TicketRepository>(),
              )..checkTicketStatus(
                  AuthCubit.instance.state.accessToken,
                ),
              lazy: false,
            ),
            BlocProvider<CFSCubit>(
              lazy: false,
              create: (context) => CFSCubit(
                context.read<CFSRepository>(),
              )..checkSpeakerProfileExists(
                  authToken: AuthCubit.instance.state.accessToken,
                ),
            ),
            BlocProvider<TeamCubit>(
                create: (context) =>
                    TeamCubit(context.read<TeamRepository>())..getTeam(),
                lazy: true),
            BlocProvider<TechnologyCubit>(
              lazy: false,
              create: (context) => TechnologyCubit(
                context.read<TechnologyRepository>(),
              )..getTechnologies(),
            ),
            BlocProvider<TeamCubit>(
                create: (context) =>
                    TeamCubit(context.read<TeamRepository>())..getTeam(),
                lazy: true),
            BlocProvider<SpeakerCubit>(
                create: (context) =>
                    SpeakerCubit(context.read<SpeakerRepository>())
                      ..getSpeaker(),
                lazy: true),
            BlocProvider<ScheduleCubit>(
                create: (context) =>
                    ScheduleCubit(context.read<ScheduleRepository>())
                      ..getSchedule(),
                lazy: true),
          ],
          builder: (context) => LoginListener(
            onLogin: (context, authState) {
              appRouter.pushAndPopUntil(
                const HomeRoute(),
                predicate: (route) => false,
              );
              context.read<CFSCubit>().checkSpeakerProfileExists(
                    authToken: authState.accessToken,
                  );
              context.read<TicketCubit>().checkTicketStatus(
                    authState.accessToken,
                  );
            },
            onLogout: (context) {
              context.read<TicketCubit>().clearTicketStatus();
              context.read<CFSCubit>().clearTalks();
              appRouter.pushAndPopUntil(
                const HomeRoute(),
                predicate: (route) => false,
              );
            },
            child: AppCubitConsumer(
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
                      return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        scaffoldMessengerKey:
                            DjangoflowAppSnackbar.scaffoldMessengerKey,
                        title: appTitle,
                        theme: AppTheme.light,
                        darkTheme: AppTheme.dark,
                        themeMode: ThemeMode.dark,
                        //appState.themeMode, (TODO : uncomment once we get instruction to enable)
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
          ),
        );
}
