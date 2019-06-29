import 'package:fluttered/select_ctrl/select_state.dart';
import 'package:meta/meta.dart';

class SelectCtrl<T> {
  final SelectState state;
  final String Function(T t) idGetter;

  SelectCtrl({
    @required this.state,
    @required this.idGetter,
  });

  void toggle(T t) {
    String id = idGetter(t);
    if (state.selected.containsKey(id)) {
      state.remove(id);
    } else {
      state[id] = t;
    }
  }

  void initSelected(Iterable<T> values) {
    state.selected = Map.fromIterable(values, key: idGetter, value: (value) => value);
  }

  void single(T value) {
    initSelected([value]);
  }
}
