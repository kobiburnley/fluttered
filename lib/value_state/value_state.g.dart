part of 'value_state.dart';

mixin _$ValueState<T> on ValueStateBase<T> {
  Atom _value = Atom();
  T get value {
    _value.reportObserved();
    return super.value;
  }
  set value(T value) {
    super.value = value;
    _value.reportChanged();
  }
}