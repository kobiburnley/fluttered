import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttered/nav_ctrl/stack_nav.dart';

class FlutterNavCtrl implements StackNav {
  final NavigatorState navigatorState;
  final Map<String, WidgetBuilder> routes;

  FlutterNavCtrl(this.navigatorState, this.routes);

  Route<T> buildRoute<T>(String name, [Object arguments]) {
    WidgetBuilder builder = routes[name];
    assert(builder != null);
    return MaterialPageRoute<T>(
        builder: builder,
        settings: RouteSettings(name: name, arguments: arguments)
    );
  }

  @optionalTypeArgs
  Future<T> push<T extends Object>(String name, [Object arguments]) {
    return navigatorState.push(buildRoute<T>(name, arguments));
  }

  @optionalTypeArgs
  Future<T> pushAndRemoveUntil<T extends Object>(String name,
      {@required String until, Object arguments}) {
    return navigatorState.pushAndRemoveUntil(
        buildRoute<T>(name, arguments), ModalRoute.withName(name));
  }

  @optionalTypeArgs
  bool pop<T extends Object>([T result]) {
    return navigatorState.pop(result);
  }

  void popUntil(String name) {
    navigatorState.popUntil(ModalRoute.withName(name));
  }
}
