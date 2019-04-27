import 'nav_state.dart';
import 'package:mobx/mobx.dart';

class NavCtrl {
  final NavState state;

  NavCtrl._(this.state);

  factory NavCtrl(NavState state) {
    return NavCtrl._(state);
  }

  void navTo(String route, [Map<String, String> data = const {}, bool inherit = false]) {
    runInAction(() {
      state.route = route;
      state.changeData(data, inherit);
    });
  }

  String get(String key) {
    return state.get(key);
  }
}
