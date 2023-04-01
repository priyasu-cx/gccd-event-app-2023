// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:ccd2023/configurations/router/auth_guard.dart' as _i13;
import 'package:ccd2023/features/app/app.dart' as _i10;
import 'package:ccd2023/features/auth/auth.dart' as _i3;
import 'package:ccd2023/features/coc/pages/coc_page.dart' as _i9;
import 'package:ccd2023/features/faq/pages/faq_page.dart' as _i8;
import 'package:ccd2023/features/home/presentation/pages/home_page.dart' as _i1;
import 'package:ccd2023/features/profile/presentation/pages/profile_page.dart'
    as _i6;
import 'package:ccd2023/features/speaker/speaker.dart' as _i2;
import 'package:ccd2023/features/team/pages/team_page.dart' as _i7;
import 'package:ccd2023/features/tickets/data/model/ticket_model.dart' as _i14;
import 'package:ccd2023/features/tickets/pages/buy_ticket_page.dart' as _i4;
import 'package:ccd2023/features/tickets/pages/view_ticket_page.dart' as _i5;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CFSRouterRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.WrappedRoute(child: const _i2.CFSRouterPage()),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpPage(),
      );
    },
    ActivateEmailRoute.name: (routeData) {
      final args = routeData.argsAs<ActivateEmailRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ActivateEmailPage(
          key: args.key,
          title: args.title,
          message: args.message,
        ),
      );
    },
    ForgotPassRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPassPage(),
      );
    },
    BuyTicketRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.BuyTicketPage(),
      );
    },
    ViewTicketRoute.name: (routeData) {
      final args = routeData.argsAs<ViewTicketRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.ViewTicketPage(
          key: args.key,
          ticket: args.ticket,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfilePage(),
      );
    },
    TeamRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.TeamPage(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.FAQPage(),
      );
    },
    CoCRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.CoCPage(),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.UnknownPage(),
      );
    },
    CFSRoute.name: (routeData) {
      final args =
          routeData.argsAs<CFSRouteArgs>(orElse: () => const CFSRouteArgs());
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.CFSPage(
          key: args.key,
          talkTitle: args.talkTitle,
          talkDescription: args.talkDescription,
          talkOverview: args.talkOverview,
          talkEvent: args.talkEvent,
          talkType: args.talkType,
          topicsOfExpertise: args.topicsOfExpertise,
          talkId: args.talkId,
          addedAt: args.addedAt,
          status: args.status,
        ),
      );
    },
    TalkListRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.TalkListPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i11.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i11.RouteConfig(
          CFSRouterRoute.name,
          path: '/cfs',
          guards: [authGuard],
          children: [
            _i11.RouteConfig(
              CFSRoute.name,
              path: '',
              parent: CFSRouterRoute.name,
            ),
            _i11.RouteConfig(
              TalkListRoute.name,
              path: 'talks',
              parent: CFSRouterRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i11.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i11.RouteConfig(
          ActivateEmailRoute.name,
          path: '/activate-account',
        ),
        _i11.RouteConfig(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        ),
        _i11.RouteConfig(
          BuyTicketRoute.name,
          path: '/buy-tickets',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          ViewTicketRoute.name,
          path: '/view-tickets',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          TeamRoute.name,
          path: '/team',
        ),
        _i11.RouteConfig(
          FAQRoute.name,
          path: '/faq',
        ),
        _i11.RouteConfig(
          CoCRoute.name,
          path: '/coc',
        ),
        _i11.RouteConfig(
          UnknownRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CFSRouterPage]
class CFSRouterRoute extends _i11.PageRouteInfo<void> {
  const CFSRouterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CFSRouterRoute.name,
          path: '/cfs',
          initialChildren: children,
        );

  static const String name = 'CFSRouterRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.ActivateEmailPage]
class ActivateEmailRoute extends _i11.PageRouteInfo<ActivateEmailRouteArgs> {
  ActivateEmailRoute({
    _i12.Key? key,
    required String title,
    required String message,
  }) : super(
          ActivateEmailRoute.name,
          path: '/activate-account',
          args: ActivateEmailRouteArgs(
            key: key,
            title: title,
            message: message,
          ),
        );

  static const String name = 'ActivateEmailRoute';
}

class ActivateEmailRouteArgs {
  const ActivateEmailRouteArgs({
    this.key,
    required this.title,
    required this.message,
  });

  final _i12.Key? key;

  final String title;

  final String message;

  @override
  String toString() {
    return 'ActivateEmailRouteArgs{key: $key, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i3.ForgotPassPage]
class ForgotPassRoute extends _i11.PageRouteInfo<void> {
  const ForgotPassRoute()
      : super(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        );

  static const String name = 'ForgotPassRoute';
}

/// generated route for
/// [_i4.BuyTicketPage]
class BuyTicketRoute extends _i11.PageRouteInfo<void> {
  const BuyTicketRoute()
      : super(
          BuyTicketRoute.name,
          path: '/buy-tickets',
        );

  static const String name = 'BuyTicketRoute';
}

/// generated route for
/// [_i5.ViewTicketPage]
class ViewTicketRoute extends _i11.PageRouteInfo<ViewTicketRouteArgs> {
  ViewTicketRoute({
    _i12.Key? key,
    required _i14.Ticket ticket,
  }) : super(
          ViewTicketRoute.name,
          path: '/view-tickets',
          args: ViewTicketRouteArgs(
            key: key,
            ticket: ticket,
          ),
        );

  static const String name = 'ViewTicketRoute';
}

class ViewTicketRouteArgs {
  const ViewTicketRouteArgs({
    this.key,
    required this.ticket,
  });

  final _i12.Key? key;

  final _i14.Ticket ticket;

  @override
  String toString() {
    return 'ViewTicketRouteArgs{key: $key, ticket: $ticket}';
  }
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i7.TeamPage]
class TeamRoute extends _i11.PageRouteInfo<void> {
  const TeamRoute()
      : super(
          TeamRoute.name,
          path: '/team',
        );

  static const String name = 'TeamRoute';
}

/// generated route for
/// [_i8.FAQPage]
class FAQRoute extends _i11.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i9.CoCPage]
class CoCRoute extends _i11.PageRouteInfo<void> {
  const CoCRoute()
      : super(
          CoCRoute.name,
          path: '/coc',
        );

  static const String name = 'CoCRoute';
}

/// generated route for
/// [_i10.UnknownPage]
class UnknownRoute extends _i11.PageRouteInfo<void> {
  const UnknownRoute()
      : super(
          UnknownRoute.name,
          path: '*',
        );

  static const String name = 'UnknownRoute';
}

/// generated route for
/// [_i2.CFSPage]
class CFSRoute extends _i11.PageRouteInfo<CFSRouteArgs> {
  CFSRoute({
    _i12.Key? key,
    String? talkTitle,
    String? talkDescription,
    String? talkOverview,
    int? talkEvent,
    String? talkType,
    List<int>? topicsOfExpertise,
    int? talkId,
    String? addedAt,
    String? status,
  }) : super(
          CFSRoute.name,
          path: '',
          args: CFSRouteArgs(
            key: key,
            talkTitle: talkTitle,
            talkDescription: talkDescription,
            talkOverview: talkOverview,
            talkEvent: talkEvent,
            talkType: talkType,
            topicsOfExpertise: topicsOfExpertise,
            talkId: talkId,
            addedAt: addedAt,
            status: status,
          ),
        );

  static const String name = 'CFSRoute';
}

class CFSRouteArgs {
  const CFSRouteArgs({
    this.key,
    this.talkTitle,
    this.talkDescription,
    this.talkOverview,
    this.talkEvent,
    this.talkType,
    this.topicsOfExpertise,
    this.talkId,
    this.addedAt,
    this.status,
  });

  final _i12.Key? key;

  final String? talkTitle;

  final String? talkDescription;

  final String? talkOverview;

  final int? talkEvent;

  final String? talkType;

  final List<int>? topicsOfExpertise;

  final int? talkId;

  final String? addedAt;

  final String? status;

  @override
  String toString() {
    return 'CFSRouteArgs{key: $key, talkTitle: $talkTitle, talkDescription: $talkDescription, talkOverview: $talkOverview, talkEvent: $talkEvent, talkType: $talkType, topicsOfExpertise: $topicsOfExpertise, talkId: $talkId, addedAt: $addedAt, status: $status}';
  }
}

/// generated route for
/// [_i2.TalkListPage]
class TalkListRoute extends _i11.PageRouteInfo<void> {
  const TalkListRoute()
      : super(
          TalkListRoute.name,
          path: 'talks',
        );

  static const String name = 'TalkListRoute';
}
