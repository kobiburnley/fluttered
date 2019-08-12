import 'package:fluttered/select_ctrl/select_state.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

class SelectCtrl<T> {
  final SelectState<T> state;
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
    state.selected = Map.fromIterables(values.map(idGetter), values);
  }

  void single(T value) {
    initSelected([value]);
  }

  void reorder(int oldIndex, int newIndex) {
    runInAction(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      List<MapEntry<String, T>> newList = [];
      newList.addAll(state.selected.entries.toList());
      final item = newList.removeAt(oldIndex);
      newList.insert(newIndex, item);
      state.selected = Map.fromEntries(newList);
    });
  }
}
