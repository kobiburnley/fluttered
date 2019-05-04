
import 'package:flutter/widgets.dart';
import 'package:fluttered/nav_ctrl/nav_ctrl.dart';

class CurrentRouteNavObserver extends NavigatorObserver {
  NavCtrl ctrl;

  CurrentRouteNavObserver(this.ctrl);

  void navTo(Route<dynamic> route) {
    final settings = route?.settings;
    if(settings != null) {
      ctrl.navTo(settings.name);
      print(ctrl.state.route);
    }
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    navTo(route);
  }

  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
  }

  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    navTo(newRoute);
  }

  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    navTo(route);
  }
}
