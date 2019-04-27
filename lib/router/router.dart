import 'package:flutter/material.dart';
import 'package:fluttered/nav_ctrl/nav_ctrl.dart';
import 'package:fluttered/reactive/reactive.dart';

class Router extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final NavCtrl ctrl;
  final Widget child;

  Router({this.routes, this.child, this.ctrl});

  Widget build(BuildContext context) {
    return Reactive(
      onInvalidate: (firstTime) {
        WidgetBuilder builder = routes[ctrl.state.route];
        if (builder != null && !firstTime) {
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: builder));
        }
      },
      builder: (_) => child,
    );
  }
}
