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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:ccd2023/features/app/app.dart' as _i6;
import 'package:ccd2023/features/auth/auth.dart' as _i2;
import 'package:ccd2023/features/auth/presentation/pages/activate_email_page.dart'
    as _i3;
import 'package:ccd2023/features/auth/presentation/pages/forgot_pass_page.dart'
    as _i4;
import 'package:ccd2023/features/faq/pages/faq_page.dart' as _i5;
import 'package:ccd2023/features/home/pages/home_page.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignUpPage(),
      );
    },
    ActivateEmailRoute.name: (routeData) {
      final args = routeData.argsAs<ActivateEmailRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.ActivateEmailPage(
          key: args.key,
          title: args.title,
          message: args.message,
        ),
      );
    },
    ForgotPassRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.ForgotPassPage(),
      );
    },
    FAQRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.FAQPage(),
      );
    },
    UnknownRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.UnknownPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i7.RouteConfig(
          ActivateEmailRoute.name,
          path: '/activate-account',
        ),
        _i7.RouteConfig(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        ),
        _i7.RouteConfig(
          FAQRoute.name,
          path: '/faq',
        ),
        _i7.RouteConfig(
          UnknownRoute.name,
          path: '*',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.ActivateEmailPage]
class ActivateEmailRoute extends _i7.PageRouteInfo<ActivateEmailRouteArgs> {
  ActivateEmailRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String title;

  final String message;

  @override
  String toString() {
    return 'ActivateEmailRouteArgs{key: $key, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i4.ForgotPassPage]
class ForgotPassRoute extends _i7.PageRouteInfo<void> {
  const ForgotPassRoute()
      : super(
          ForgotPassRoute.name,
          path: '/forgot-pass',
        );

  static const String name = 'ForgotPassRoute';
}

/// generated route for
/// [_i5.FAQPage]
class FAQRoute extends _i7.PageRouteInfo<void> {
  const FAQRoute()
      : super(
          FAQRoute.name,
          path: '/faq',
        );

  static const String name = 'FAQRoute';
}

/// generated route for
/// [_i6.UnknownPage]
class UnknownRoute extends _i7.PageRouteInfo<void> {
  const UnknownRoute()
      : super(
          UnknownRoute.name,
          path: '*',
        );

  static const String name = 'UnknownRoute';
}
