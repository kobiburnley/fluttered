part of 'nav_state.dart';

mixin _$NavState on BaseNavState {
  Atom _route = new Atom();

  String get route {
    _route.reportObserved();
    return super.route;
  }

  set route(String route) {
    super.route = route;
    _route.reportChanged();
  }
}
