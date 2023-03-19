import 'package:auto_route/annotations.dart';
import 'package:ccd2023/features/app/app.dart';
import 'package:ccd2023/features/home/home.dart';
import 'package:ccd2023/features/auth/auth.dart';
import 'package:ccd2023/features/faq/pages/faq_page.dart';
import 'package:ccd2023/features/coc/pages/coc_page.dart';
import 'package:ccd2023/features/profile/pages/profile_page.dart';
import 'package:ccd2023/features/speaker/presentation/pages/cfs_page.dart';

import '../../features/buy_tickets/pages/buy_ticket_page.dart';

export 'package:auto_route/auto_route.dart';
export 'ccd_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, path: "/home"),
    AutoRoute(page: CFSPage, path: "/cfs"),
    AutoRoute(page: LoginPage, path: "/login"),
    AutoRoute(page: SignUpPage, path: "/signup"),
    AutoRoute(page: ActivateEmailPage, path: "/activate-account"),
    AutoRoute(page: ForgotPassPage, path: "/forgot-pass"),
    AutoRoute(page: BuyTicketPage, path: "/buy-tickets"),
    AutoRoute(page: ProfilePage, path: "/profile"),
    AutoRoute(page: FAQPage, path: "/faq"),
    AutoRoute(page: CoCPage, path: "/coc"),
    AutoRoute(path: '*', page: UnknownPage),
  ],
)
class $AppRouter {}
