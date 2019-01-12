import 'package:action_tree_core/action_tree_core.dart';
import 'package:fluttered/src/ctrl/nav/nav_state.dart';

class NavCtrl extends Ctrl<NavState>{
  final NavState state;

  Action<NavState> nav;

  Iterable<Action<NavState>> get actions => [nav];

  NavCtrl._(this.state) {
    nav = Action(
      ctrl: this,
      name: "nav"
    );
  }

  factory NavCtrl([NavState state]) {
    return NavCtrl._(state ?? NavState());
  }

  void navTo(String route, [Map<String, String> data = const {}, bool inherit = false]) {
    nav.setState(() {
      state.route = route;
      state.changeData(data, inherit);
    });
  }

  String get(String key) {
    return state.get(key);
  }
}
