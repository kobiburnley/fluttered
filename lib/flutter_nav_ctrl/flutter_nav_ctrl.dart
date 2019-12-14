import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttered/nav_ctrl/stack_nav.dart';

class FlutterNavCtrl implements StackNav {
  final NavigatorState navigatorState;
  final Map<String, WidgetBuilder> routes;

  FlutterNavCtrl(this.navigatorState, this.routes);

  Route<T> buildRoute<T>({@required String name,
    Object arguments,
    bool fullscreenDialog}) {
    WidgetBuilder builder = routes[name];
    assert(builder != null);
    return MaterialPageRoute<T>(
      builder: builder,
      settings: RouteSettings(name: name, arguments: arguments),
      fullscreenDialog: fullscreenDialog ?? false,);
  }

  @optionalTypeArgs
  Future<T> push<T extends Object>(
      {@required String name, Object arguments, bool fullscreenDialog}) {
    return navigatorState.push(buildRoute<T>(
      name: name,
      arguments: arguments,
      fullscreenDialog: fullscreenDialog,
    ));
  }

  @optionalTypeArgs
  Future<T> pushAndRemoveUntil<T extends Object>({@required String name,
    @required String until,
    Object arguments,
    bool fullscreenDialog}) {
    return navigatorState.pushAndRemoveUntil(
      buildRoute<T>(
        name: name,
        arguments: arguments,
        fullscreenDialog: fullscreenDialog,
      ),
      ModalRoute.withName(name),
    );
  }

  @optionalTypeArgs
  bool pop<T extends Object>([T result]) {
    return navigatorState.pop(result);
  }

  void popUntil(String name) {
    navigatorState.popUntil(ModalRoute.withName(name));
  }
}
