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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:ccd2023/configurations/router/auth_guard.dart' as _i14;
import 'package:ccd2023/features/app/app.dart' as _i11;
import 'package:ccd2023/features/auth/auth.dart' as _i4;
import 'package:ccd2023/features/coc/pages/coc_page.dart' as _i10;
import 'package:ccd2023/features/faq/pages/faq_page.dart' as _i9;
import 'package:ccd2023/features/home/presentation/pages/home_page.dart' as _i1;
import 'package:ccd2023/features/profile/presentation/pages/profile_page.dart'
    as _i7;
import 'package:ccd2023/features/speaker/presentation/pages/cfs_page.dart'
    as _i2;
import 'package:ccd2023/features/speaker/presentation/pages/talk_list_page.dart'
    as _i3;
import 'package:ccd2023/features/team/pages/team_page.dart' as _i8;
import 'package:ccd2023/features/tickets/data/model/ticket_model.dart' as _i15;
import 'package:ccd2023/features/tickets/pages/buy_ticket_page.dart' as _i5;
import 'package:ccd2023/features/tickets/pages/view_ticket_page.dart' as _i6;
import 'package:flutter/material.dart' as _i13;

class AppRouter extends _i12.RootStackRouter {
  AppRouter({
    _i13.GlobalKey<_i13.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i14.AuthGuard authGuard;

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    CFSRoute.name: (routeData) {
      final args =
          routeData.argsAs<CFSRouteArgs>(orElse: () => const CFSRouteArgs());
      return _i12.AdaptivePage<dynamic>(
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
        ),
      );
    },
    TalkListRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.TalkListPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpPage(),
      );
    },
    ActivateEmailRoute.name: (routeData) {
      final args = routeData.argsAs<ActivateEmailRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.ActivateEmailPage(
          key: args.key,
          title: args.title,
          message: args.message,
        ),
      );
    },
    ForgotPassRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPassPage(),
      );
    },
    BuyTicketRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.BuyTicketPage(),
      );
    },
    ViewTicketRoute.name: (routeData) {
      final args = routeData.argsAs<ViewTicketRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.ViewTicketPage(
          key: args.key,
          ticket: args.ticket,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    TeamRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.TeamPage(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.FAQPage(),
      );
    },
    CoCRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.CoCPage(),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.UnknownPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i12.RouteConfig(
          CFSRoute.name,
          path: '/cfs',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          TalkListRoute.name,
          path: '/talk-list',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i12.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i12.RouteConfig(
          ActivateEmailRoute.name,
          path: '/activate-account',
        ),
        _i12.RouteConfig(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        ),
        _i12.RouteConfig(
          BuyTicketRoute.name,
          path: '/buy-tickets',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          ViewTicketRoute.name,
          path: '/view-tickets',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          guards: [authGuard],
        ),
        _i12.RouteConfig(
          TeamRoute.name,
          path: '/team',
        ),
        _i12.RouteConfig(
          FAQRoute.name,
          path: '/faq',
        ),
        _i12.RouteConfig(
          CoCRoute.name,
          path: '/coc',
        ),
        _i12.RouteConfig(
          UnknownRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CFSPage]
class CFSRoute extends _i12.PageRouteInfo<CFSRouteArgs> {
  CFSRoute({
    _i13.Key? key,
    String? talkTitle,
    String? talkDescription,
    String? talkOverview,
    int? talkEvent,
    String? talkType,
    List<int>? topicsOfExpertise,
    int? talkId,
  }) : super(
          CFSRoute.name,
          path: '/cfs',
          args: CFSRouteArgs(
            key: key,
            talkTitle: talkTitle,
            talkDescription: talkDescription,
            talkOverview: talkOverview,
            talkEvent: talkEvent,
            talkType: talkType,
            topicsOfExpertise: topicsOfExpertise,
            talkId: talkId,
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
  });

  final _i13.Key? key;

  final String? talkTitle;

  final String? talkDescription;

  final String? talkOverview;

  final int? talkEvent;

  final String? talkType;

  final List<int>? topicsOfExpertise;

  final int? talkId;

  @override
  String toString() {
    return 'CFSRouteArgs{key: $key, talkTitle: $talkTitle, talkDescription: $talkDescription, talkOverview: $talkOverview, talkEvent: $talkEvent, talkType: $talkType, topicsOfExpertise: $topicsOfExpertise, talkId: $talkId}';
  }
}

/// generated route for
/// [_i3.TalkListPage]
class TalkListRoute extends _i12.PageRouteInfo<void> {
  const TalkListRoute()
      : super(
          TalkListRoute.name,
          path: '/talk-list',
        );

  static const String name = 'TalkListRoute';
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i12.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.ActivateEmailPage]
class ActivateEmailRoute extends _i12.PageRouteInfo<ActivateEmailRouteArgs> {
  ActivateEmailRoute({
    _i13.Key? key,
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

  final _i13.Key? key;

  final String title;

  final String message;

  @override
  String toString() {
    return 'ActivateEmailRouteArgs{key: $key, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i4.ForgotPassPage]
class ForgotPassRoute extends _i12.PageRouteInfo<void> {
  const ForgotPassRoute()
      : super(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        );

  static const String name = 'ForgotPassRoute';
}

/// generated route for
/// [_i5.BuyTicketPage]
class BuyTicketRoute extends _i12.PageRouteInfo<void> {
  const BuyTicketRoute()
      : super(
          BuyTicketRoute.name,
          path: '/buy-tickets',
        );

  static const String name = 'BuyTicketRoute';
}

/// generated route for
/// [_i6.ViewTicketPage]
class ViewTicketRoute extends _i12.PageRouteInfo<ViewTicketRouteArgs> {
  ViewTicketRoute({
    _i13.Key? key,
    required _i15.Ticket ticket,
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

  final _i13.Key? key;

  final _i15.Ticket ticket;

  @override
  String toString() {
    return 'ViewTicketRouteArgs{key: $key, ticket: $ticket}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i8.TeamPage]
class TeamRoute extends _i12.PageRouteInfo<void> {
  const TeamRoute()
      : super(
          TeamRoute.name,
          path: '/team',
        );

  static const String name = 'TeamRoute';
}

/// generated route for
/// [_i9.FAQPage]
class FAQRoute extends _i12.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i10.CoCPage]
class CoCRoute extends _i12.PageRouteInfo<void> {
  const CoCRoute()
      : super(
          CoCRoute.name,
          path: '/coc',
        );

  static const String name = 'CoCRoute';
}

/// generated route for
/// [_i11.UnknownPage]
class UnknownRoute extends _i12.PageRouteInfo<void> {
  const UnknownRoute()
      : super(
          UnknownRoute.name,
          path: '*',
        );

  static const String name = 'UnknownRoute';
}
