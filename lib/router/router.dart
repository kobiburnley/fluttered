import 'package:flutter/material.dart';
import 'package:fluttered/nav_ctrl/nav_ctrl.dart';
import 'package:fluttered/reactive/reactive.dart';

class Router extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final NavCtrl ctrl;

  Router({this.routes, this.ctrl});

  Widget build(BuildContext context) {
    WidgetBuilder builder = routes[ctrl.state.route];
    if(builder == null) {
      builder = (_) => Text('WidgetBuilder not found for initialState "${ctrl.state.route}"');
    }
    return Reactive(
      onInvalidate: (firstTime) {
        WidgetBuilder builder = routes[ctrl.state.route];
        if (builder != null && !firstTime) {
          Navigator.of(context).push(
              MaterialPageRoute<Null>(
                  builder: builder,
                settings: RouteSettings(name: ctrl.state.route)
              )
          );
        }
      },
      builder: builder,
    );
  }
}
