import 'package:fluttered/browse_ctrl/browse_state.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

part 'select_state.g.dart';

class SelectState<T> = SelectStateBase<T> with _$SelectState<T>;

class SelectStateBase<T> {
  Map<String, T> selected;

  SelectStateBase({@required this.selected});
}
