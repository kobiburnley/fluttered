part of 'select_state.dart';

mixin _$SelectState<T> on SelectStateBase<T> {
  Atom _selected = new Atom();
  get selected {
    _selected.reportObserved();
    return super.selected;
  }
  set selected(selected) {
    super.selected = selected;
    _selected.reportChanged();
  }
  T remove(Object key) {
    T t = super.selected.remove(key);
    _selected.reportChanged();
    return t;
  }
  void operator []=(String key, T value) {
    super.selected[key] = value;
    _selected.reportChanged();
  }
}