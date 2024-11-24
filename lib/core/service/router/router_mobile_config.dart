import 'package:auto_route/auto_route.dart';
import 'package:code_demonstration/presentation/screens/root_route.dart';
import 'package:code_demonstration/presentation/screens/search_screen/search_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'router_mobile_config.gr.dart';

@AutoRouterConfig()
class RouterMobileConfig extends RootStackRouter {
  AutoRoute _getPlatformRoute({
    required PageInfo page,
    String? path,
    bool initial = false,
    List<AutoRoute>? children,
    List<AutoRouteGuard> guards = const [],
  }) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return CustomRoute<dynamic>(
        page: page,
        path: path,
        initial: initial,
        children: children,
        guards: guards,
        durationInMilliseconds: 200,
        reverseDurationInMilliseconds: 200,
        transitionsBuilder: (_, animation, __, child) {
          final transitionAnim = Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          );
          return SlideTransition(position: transitionAnim, child: child);
        },
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoRoute<dynamic>(
        page: page,
        path: path,
        initial: initial,
        children: children,
        guards: guards,
      );
    }

    return AdaptiveRoute<dynamic>(
      page: page,
      path: path,
      initial: initial,
      children: children,
      guards: guards,
    );
  }

  @override
  List<AutoRoute> get routes => [
        _getPlatformRoute(
          page: RootRoute.page,
          path: "/",
          children: [
            _getPlatformRoute(
              page: SearchRoute.page,
              path: 'search',
              initial: true,
            )
          ],
        )
      ];
}
