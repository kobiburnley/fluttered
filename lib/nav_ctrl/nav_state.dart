import 'package:mobx/mobx.dart';

part 'nav_state.g.dart';

class NavState = BaseNavState with _$NavState;

class BaseNavState {
  String route;
  Map<String, String> data;

  BaseNavState({this.route = "", this.data = const {}});

  String get(String key) {
    return data[key] ?? "";
  }
}
