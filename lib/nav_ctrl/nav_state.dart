import 'package:mobx/mobx.dart';

part 'nav_state.g.dart';

class NavState = BaseNavState with _$NavState;

class BaseNavState {
  String route;

  BaseNavState({this.route = ""});
}
