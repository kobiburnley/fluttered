
import 'package:flutter/widgets.dart';
import 'package:fluttered/nav_ctrl/nav_ctrl.dart';

class CurrentRouteNavObserver extends RouteObserver<Route> {
  NavCtrl ctrl;

  CurrentRouteNavObserver(this.ctrl);

  void navTo(Route<dynamic> route) {
    final settings = route?.settings;
    if(settings != null) {
      ctrl.navTo(settings.name);
    }
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    navTo(route);
  }

  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    navTo(newRoute);
  }

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    navTo(route);
  }
}
