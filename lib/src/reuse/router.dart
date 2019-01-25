import 'package:flutter/material.dart';
import 'package:fluttered/src/ctrl/nav/nav.dart';
import 'package:fluttered/src/reuse/reactive.dart';

class Router extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final NavCtrl ctrl;
  final Widget child;

  Router({this.routes, this.child, this.ctrl});

  Widget build(BuildContext context) {
    return Reactive(
      onInvalidate: () {
        WidgetBuilder builder = routes[ctrl.state.route];
        if (builder != null) {
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: builder));
        }
      },
      builder: (_) => child,
    );
  }
}
