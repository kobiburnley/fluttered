

import 'package:action_tree_flutter/action_tree_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttered/src/ctrl/nav/nav.dart';

class Router extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;
  final ValueGetter<NavCtrl> getCtrl;
  final Widget child;

  Router({this.routes, this.child, this.getCtrl});

  Widget build(BuildContext context) {
    return ObserverBuilder<NavState, NavCtrl>(
      handleChange: (NavState state) {
        WidgetBuilder builder = routes[state.route];
        if(builder != null) {
          Navigator.of(context).push(MaterialPageRoute<Null>(builder: builder));
        }
      },
      getCtrl: getCtrl,
      builder: (_, __) => child,
    );
  }
}
