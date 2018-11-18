import 'package:action_tree_core/action_tree_core.dart';
import 'package:fluttered/src/ctrl/nav/nav_state.dart';

class NavCtrl extends Ctrl<NavState>{
  final StateHolder<NavState> stateHolder;

  Action<NavState> nav;

  Iterable<Action<NavState>> get actions => [nav];

  NavCtrl._(this.stateHolder) {
    nav = Action(
      ctrl: this,
      name: "nav"
    );
  }

  factory NavCtrl([StateHolder<NavState> stateHolder]) {
    stateHolder ??= SelfStateHolder(NavState());
    return NavCtrl._(stateHolder);
  }

  void navTo(String route) {
    nav.setState(() {
      state.route = route;
    });
  }
}
