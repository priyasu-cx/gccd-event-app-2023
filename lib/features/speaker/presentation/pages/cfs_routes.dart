import 'package:ccd2023/features/speaker/speaker.dart';

import '../../../../configurations/configurations.dart';

const cfsRoutes = [
  AutoRoute(
    path: '',
    page: CFSPage,
    initial: true,
  ),
  AutoRoute(
    path: 'talks',
    page: TalkListPage,
  ),
];
