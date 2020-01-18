import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'value_state.g.dart';

class ValueState<T> extends ValueStateBase<T> with _$ValueState<T> {

  ValueState({@required T value}): super(value: value);
}

class ValueStateBase<T> {
  T value;

  ValueStateBase({@required this.value});
}
