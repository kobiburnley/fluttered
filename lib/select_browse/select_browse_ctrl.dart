import 'dart:async';

import 'package:fluttered/browse_ctrl/browse_ctrl.dart';
import 'package:fluttered/browse_ctrl/browse_state.dart';
import 'package:fluttered/query_result_ctrl/query_result.dart';
import 'package:fluttered/select_browse/select_browse_state.dart';
import 'package:fluttered/select_ctrl/select_ctrl.dart';
import 'package:fluttered/select_ctrl/select_state.dart';
import 'package:meta/meta.dart';

class SelectBrowseCtrl<T> {
  SelectBrowseState<T> state;
  BrowseCtrl<T> browse;
  SelectCtrl<T> select;

  SelectBrowseCtrl(
      {@required this.state, @required this.browse, @required this.select});

  factory SelectBrowseCtrl.empty(
      {SelectBrowseState<T> state,
      Future<QueryResult<T>> Function() fetchData,
      String Function(T t) idGetter}) {
    final browse =
        BrowseCtrl<T>(state: state.browse, fetchData: fetchData);

    final select = SelectCtrl(state: state.select, idGetter: idGetter);

    return SelectBrowseCtrl(state: state, browse: browse, select: select);
  }
}
