import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttered/current_route_nav_observer/current_route_nav_observer.dart';
import 'package:fluttered/message/message.dart';
import 'package:fluttered/nav_ctrl/stack_nav.dart';

typedef RouteWidgetBuilder = Widget Function(
    BuildContext context, FlutterNavCtrl nav, Object args);

class FlutterNavCtrl implements StackNav {
  final NavigatorState navigatorState;
  final CurrentRouteNavObserver routeObserver;
  final Map<String, RouteWidgetBuilder> routes;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      builder: (context) => builder(context, this, arguments),
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

  void dismissSnackBar() {
    final scaffoldState = scaffoldKey.currentState;
    if (scaffoldState != null) {
      scaffoldState.hideCurrentSnackBar();
    }
  }

  void showSnackBar(Message message) {
    final scaffoldState = scaffoldKey.currentState;
    print('showSnackBar');
    if (scaffoldState != null) {
      scaffoldState.showSnackBar(SnackBar(
        backgroundColor: message.type == MessageType.warning
            ? Color(0xffffcb11)
            : Color(0xff1d0047),
        content: Text(
          message.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
//          style: theme.textTheme.subtitle1.copyWith(color: Colors.white)
        ),
        action: SnackBarAction(
          label: 'DISMISS',
//          textColor: Colors.white,
          onPressed: () {
            dismissSnackBar();
          },
        ),
      ));
    }
  }
}
