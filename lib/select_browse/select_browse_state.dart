import 'package:fluttered/browse_ctrl/browse_state.dart';
import 'package:fluttered/select_ctrl/select_state.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

class SelectBrowseState<T> {
  BrowseState<T> browse;
  SelectState<T> select;

  SelectBrowseState({@required this.browse, @required this.select});

  SelectBrowseState.empty({Map<String, T> selected})
      : this(browse: BrowseState.empty(), select: SelectState(selected: selected ?? {}));

  Computed<int> _indexOfSelected;

  get indexOfSelected {
    if (_indexOfSelected == null) {
      _indexOfSelected = Computed(() {
        final selected = select.selected.values;
        return selected.isNotEmpty ? browse.queryResult.records.indexOf(selected.first) : -1;
      });
    }
    return _indexOfSelected.value;
  }

  T get first => select.selected.values.firstWhere((e) => true, orElse: () => null);
}
