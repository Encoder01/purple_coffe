// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart'
    as _i13;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/dashboard.dart'
    as _i5;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/fortune_detail.dart'
    as _i2;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/my_fortune_tells.dart'
    as _i8;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/paywall.dart'
    as _i9;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/profile.dart'
    as _i10;
import 'package:purple_coffe/Screens/dashboard/presentation/pages/send_fortune_tells.dart'
    as _i7;
import 'package:purple_coffe/Screens/dashboard/presentation/widgets/sended_fortune.dart'
    as _i3;
import 'package:purple_coffe/Screens/login/data/models/user.dart' as _i14;
import 'package:purple_coffe/Screens/login/presentation/pages/login_page.dart'
    as _i6;
import 'package:purple_coffe/Screens/login/presentation/pages/signup_page.dart'
    as _i4;
import 'package:purple_coffe/Screens/login/presentation/pages/start_up.dart'
    as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    StartupScreen.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.StartupScreen());
    },
    FortuneDetail.name: (routeData) {
      final args = routeData.argsAs<FortuneDetailArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.FortuneDetail(args.fortuneTells));
    },
    SendedFortune.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SendedFortune());
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.SignUpPage(key: args.key));
    },
    DashBoard.name: (routeData) {
      final args = routeData.argsAs<DashBoardArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.DashBoard(args.appUserModel));
    },
    LoginRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.LoginPage());
    },
    SendFortuneTells.name: (routeData) {
      final args = routeData.argsAs<SendFortuneTellsArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.SendFortuneTells(args.user));
    },
    MyFortuneTells.name: (routeData) {
      final args = routeData.argsAs<MyFortuneTellsArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.MyFortuneTells(
              key: args.key, user: args.user, onTap: args.onTap));
    },
    Paywall.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.Paywall());
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i10.ProfilePage(args.appUserModel));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(StartupScreen.name, path: '/', children: [
          _i11.RouteConfig(DashBoard.name,
              path: 'dash-board',
              parent: StartupScreen.name,
              children: [
                _i11.RouteConfig(SendFortuneTells.name,
                    path: 'send-fortune-tells', parent: DashBoard.name),
                _i11.RouteConfig(MyFortuneTells.name,
                    path: 'my-fortune-tells', parent: DashBoard.name),
                _i11.RouteConfig(Paywall.name,
                    path: 'Paywall', parent: DashBoard.name),
                _i11.RouteConfig(ProfileRoute.name,
                    path: 'profile-page', parent: DashBoard.name)
              ]),
          _i11.RouteConfig(LoginRoute.name,
              path: 'login-page', parent: StartupScreen.name)
        ]),
        _i11.RouteConfig(FortuneDetail.name, path: '/fortune-detail'),
        _i11.RouteConfig(SendedFortune.name, path: '/sended-fortune'),
        _i11.RouteConfig(SignUpRoute.name, path: '/sign-up-page')
      ];
}

/// generated route for
/// [_i1.StartupScreen]
class StartupScreen extends _i11.PageRouteInfo<void> {
  const StartupScreen({List<_i11.PageRouteInfo>? children})
      : super(StartupScreen.name, path: '/', initialChildren: children);

  static const String name = 'StartupScreen';
}

/// generated route for
/// [_i2.FortuneDetail]
class FortuneDetail extends _i11.PageRouteInfo<FortuneDetailArgs> {
  FortuneDetail({required _i13.FortuneTells fortuneTells})
      : super(FortuneDetail.name,
            path: '/fortune-detail',
            args: FortuneDetailArgs(fortuneTells: fortuneTells));

  static const String name = 'FortuneDetail';
}

class FortuneDetailArgs {
  const FortuneDetailArgs({required this.fortuneTells});

  final _i13.FortuneTells fortuneTells;

  @override
  String toString() {
    return 'FortuneDetailArgs{fortuneTells: $fortuneTells}';
  }
}

/// generated route for
/// [_i3.SendedFortune]
class SendedFortune extends _i11.PageRouteInfo<void> {
  const SendedFortune() : super(SendedFortune.name, path: '/sended-fortune');

  static const String name = 'SendedFortune';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({_i12.Key? key})
      : super(SignUpRoute.name,
            path: '/sign-up-page', args: SignUpRouteArgs(key: key));

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.DashBoard]
class DashBoard extends _i11.PageRouteInfo<DashBoardArgs> {
  DashBoard(
      {required _i14.AppUserModel appUserModel,
      List<_i11.PageRouteInfo>? children})
      : super(DashBoard.name,
            path: 'dash-board',
            args: DashBoardArgs(appUserModel: appUserModel),
            initialChildren: children);

  static const String name = 'DashBoard';
}

class DashBoardArgs {
  const DashBoardArgs({required this.appUserModel});

  final _i14.AppUserModel appUserModel;

  @override
  String toString() {
    return 'DashBoardArgs{appUserModel: $appUserModel}';
  }
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: 'login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i7.SendFortuneTells]
class SendFortuneTells extends _i11.PageRouteInfo<SendFortuneTellsArgs> {
  SendFortuneTells({required _i14.AppUserModel user})
      : super(SendFortuneTells.name,
            path: 'send-fortune-tells', args: SendFortuneTellsArgs(user: user));

  static const String name = 'SendFortuneTells';
}

class SendFortuneTellsArgs {
  const SendFortuneTellsArgs({required this.user});

  final _i14.AppUserModel user;

  @override
  String toString() {
    return 'SendFortuneTellsArgs{user: $user}';
  }
}

/// generated route for
/// [_i8.MyFortuneTells]
class MyFortuneTells extends _i11.PageRouteInfo<MyFortuneTellsArgs> {
  MyFortuneTells(
      {_i12.Key? key,
      required _i14.AppUserModel user,
      required dynamic Function(int) onTap})
      : super(MyFortuneTells.name,
            path: 'my-fortune-tells',
            args: MyFortuneTellsArgs(key: key, user: user, onTap: onTap));

  static const String name = 'MyFortuneTells';
}

class MyFortuneTellsArgs {
  const MyFortuneTellsArgs({this.key, required this.user, required this.onTap});

  final _i12.Key? key;

  final _i14.AppUserModel user;

  final dynamic Function(int) onTap;

  @override
  String toString() {
    return 'MyFortuneTellsArgs{key: $key, user: $user, onTap: $onTap}';
  }
}

/// generated route for
/// [_i9.Paywall]
class Paywall extends _i11.PageRouteInfo<void> {
  const Paywall() : super(Paywall.name, path: 'Paywall');

  static const String name = 'Paywall';
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({required _i14.AppUserModel appUserModel})
      : super(ProfileRoute.name,
            path: 'profile-page',
            args: ProfileRouteArgs(appUserModel: appUserModel));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({required this.appUserModel});

  final _i14.AppUserModel appUserModel;

  @override
  String toString() {
    return 'ProfileRouteArgs{appUserModel: $appUserModel}';
  }
}
