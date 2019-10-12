import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'field_state.g.dart';

class FieldState<T> extends FieldStateBase<T> with _$FieldState<T> {

  FieldState({@required T value}): super(value: value);
}

class FieldStateBase<T> {
  T value;

  FieldStateBase({@required this.value});
}
