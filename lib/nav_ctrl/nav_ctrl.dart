import 'nav_state.dart';
import 'package:mobx/mobx.dart';

class NavCtrl {
  final NavState state;

  NavCtrl(this.state);

  void navTo(String route) {
    runInAction(() {
      state.route = route;
    });
  }
}
