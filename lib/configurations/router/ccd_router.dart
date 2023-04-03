import 'package:auto_route/annotations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/coc/pages/coc_page.dart';
import 'package:ccd2023/features/faq/pages/faq_page.dart';
import 'package:ccd2023/features/home/presentation/pages/home_page.dart';
import 'package:ccd2023/features/profile/presentation/pages/profile_page.dart';

import 'package:ccd2023/features/speaker/speaker.dart';

import 'package:ccd2023/features/speaker/presentation/pages/cfs_page.dart';
import 'package:ccd2023/features/speaker/presentation/pages/speakers_page.dart';
import 'package:ccd2023/features/speaker/presentation/pages/talk_list_page.dart';

import 'package:ccd2023/features/team/pages/team_page.dart';
import 'package:ccd2023/features/tickets/pages/view_ticket_page.dart';

import '../../features/tickets/pages/buy_ticket_page.dart';
import 'auth_guard.dart';

export 'package:auto_route/auto_route.dart';

export 'ccd_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, path: "/home"),
    AutoRoute(
      page: CFSRouterPage,
      path: "/cfs",
      guards: [AuthGuard],
      children: cfsRoutes,
    ),
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: SignUpPage, path: "/signup"),
    AutoRoute(page: ActivateEmailPage, path: "/activate-account"),
    AutoRoute(page: ForgotPassPage, path: "/forgot-pass"),
    AutoRoute(page: BuyTicketPage, path: "/buy-tickets", guards: [AuthGuard]),
    AutoRoute(page: ViewTicketPage, path: "/view-tickets", guards: [AuthGuard]),
    AutoRoute(page: ProfilePage, path: "/profile", guards: [AuthGuard]),
    AutoRoute(page: TeamPage, path: "/team"),
    AutoRoute(page: FAQPage, path: "/faq"),
    AutoRoute(page: CoCPage, path: "/coc"),
    AutoRoute(page: SpeakersPage, path: "/speakers"),
    AutoRoute(path: '*', page: UnknownPage),
  ],
)
class $AppRouter {}
