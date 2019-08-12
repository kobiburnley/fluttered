part of 'select_state.dart';

mixin _$SelectState<T> on SelectStateBase<T> {
  Atom $selected = new Atom();
  get selected {
    $selected.reportObserved();
    return super.selected;
  }
  set selected(selected) {
    super.selected = selected;
    $selected.reportChanged();
  }
  T remove(Object key) {
    T t = super.selected.remove(key);
    $selected.reportChanged();
    return t;
  }
  void operator []=(String key, T value) {
    super.selected[key] = value;
    $selected.reportChanged();
  }
}