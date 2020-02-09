import 'package:flutter/widgets.dart';

class CurrentRouteNavObserver extends RouteObserver<Route> {

  CurrentRouteNavObserver();

  void navTo(Route<dynamic> route) {

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
