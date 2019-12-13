import 'dart:async';

import 'package:fluttered/browse_ctrl/browse_ctrl.dart';
import 'package:fluttered/query_result_ctrl/query_result.dart';
import 'package:fluttered/select_browse/select_browse_state.dart';
import 'package:fluttered/select_ctrl/select_ctrl.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

class SelectBrowseCtrl<T> {
  SelectBrowseState<T> state;
  BrowseCtrl<T> browse;
  SelectCtrl<T> select;

  SelectBrowseCtrl(
      {@required this.state, @required this.browse, @required this.select});

  factory SelectBrowseCtrl.empty({@required SelectBrowseState<T> state,
    @required Future<QueryResult<T>> Function() fetchData,
    @required String Function(T t) idGetter}) {
    final browse = BrowseCtrl<T>(state: state.browse, fetchData: fetchData);

    final select = SelectCtrl(state: state.select, idGetter: idGetter);

    return SelectBrowseCtrl(state: state, browse: browse, select: select);
  }

  void selectIndex(int index) {
    final records = browse.state.queryResult.records;
    if(index >= 0 && index < records.length) {
      select.single(records.elementAt(index));
    }
  }

  void selectAndAdd(Iterable<T> items) {
    runInAction(() {
      state.browse.queryResult.addPageResult(QueryResult.fromList(items));
      select.select(items);
    });
  }
}
