import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../configurations/configurations.dart';
import '../../../app/data/repository/dio/dio_api_client.dart';
import '../../speaker.dart';

class CFSRouterPage extends StatelessWidget implements AutoRouteWrapper {
  const CFSRouterPage({super.key});

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) =>
      RepositoryProvider<TechnologyRepository>(
        create: (context) => TechnologyRepository(
          context.read<DioApiClient>(),
        ),
        child: BlocProvider<TechnologyCubit>(
          create: (context) => TechnologyCubit(
            context.read<TechnologyRepository>(),
          )..getTechnologies(),
          lazy: false,
          child: this,
        ),
      );
}
