import 'package:fluttered/browse_ctrl/browse_state.dart';
import 'package:fluttered/select_ctrl/select_state.dart';
import 'package:meta/meta.dart';

class SelectBrowseState<T> {
  BrowseState<T> browse;
  SelectState<T> select;

  SelectBrowseState({@required this.browse, @required this.select});

  SelectBrowseState.empty()
      : this(browse: BrowseState.empty(), select: SelectState(selected: {}));
}
