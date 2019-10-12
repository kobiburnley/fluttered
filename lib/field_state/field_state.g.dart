part of 'field_state.dart';

mixin _$FieldState<T> on FieldStateBase<T> {
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