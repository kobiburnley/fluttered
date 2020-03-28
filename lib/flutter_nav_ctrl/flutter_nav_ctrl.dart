import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttered/current_route_nav_observer/current_route_nav_observer.dart';
import 'package:fluttered/nav_ctrl/stack_nav.dart';

typedef RouteWidgetBuilder = Widget Function(BuildContext context, Object args);

class FlutterNavCtrl implements StackNav {
  final NavigatorState navigatorState;
  final CurrentRouteNavObserver routeObserver;
  final Map<String, RouteWidgetBuilder> routes;

  FlutterNavCtrl({
    @required this.navigatorState,
    @required this.routes,
    @required this.routeObserver,
  });

  Route<T> buildRoute<T>({
    @required String name,
    Object arguments,
    bool fullscreenDialog,
  }) {
    RouteWidgetBuilder builder = routes[name];
    assert(builder != null);
    return MaterialPageRoute<T>(
      builder: (context) => builder(context, arguments),
      settings: RouteSettings(name: name, arguments: arguments),
      fullscreenDialog: fullscreenDialog ?? false,
    );
  }

  @optionalTypeArgs
  Future<T> push<T extends Object>({
    @required String name,
    Object arguments,
    bool fullscreenDialog,
  }) {
    return navigatorState.push(buildRoute<T>(
      name: name,
      arguments: arguments,
      fullscreenDialog: fullscreenDialog,
    ));
  }

  @optionalTypeArgs
  Future<T> pushAndRemoveUntil<T extends Object>({
    @required String name,
    @required String until,
    Object arguments,
    bool fullscreenDialog,
  }) {
    return navigatorState.pushAndRemoveUntil(
      buildRoute<T>(
        name: name,
        arguments: arguments,
        fullscreenDialog: fullscreenDialog,
      ),
      ModalRoute.withName(until),
    );
  }

  @optionalTypeArgs
  bool pop<T extends Object>([T result]) {
    return navigatorState.pop(result);
  }

  void popUntil(String name) {
    navigatorState.popUntil(ModalRoute.withName(name));
  }

  String get route => routeObserver.currentRoute.settings.name;
}
