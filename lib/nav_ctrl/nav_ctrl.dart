import 'nav_state.dart';
import 'package:mobx/mobx.dart';

class NavCtrl {
  final NavState state;

  NavCtrl(this.state);

  void navTo(String route, [Map<String, String> data = const {}, bool inherit = false]) {
    runInAction(() {
      state.route = route;

      if (inherit) {
        state.data.addAll(data);
      } else {
        state.data = data;
      }
    });
  }


  String get(String key) {
    return state.get(key);
  }
}
