import 'dart:async';

import 'package:dartla_util/dartla_util.dart';
import 'package:fluttered/fetch_state/fetchState.dart';
import 'package:fluttered/query_result_ctrl/query_result.dart';
import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';

import 'browse_state.dart';

class BrowseCtrl<T> {
  final BrowseState<T> state;

  final Fun<Future<QueryResult<T>>> fetchData;

  BrowseCtrl({@required this.state, @required this.fetchData});

  void refresh() {
    runInAction(() {
      state.reset();
    });
    load();
  }

  void search(String term) {
    state.filters['search'] = term;
    refresh();
  }

  void nextPage() {
    state.pagination.nextPage();
    load();
  }

  void load() async {
    runInAction(() {
      state.fetchState = FetchState.loading;
    });
    try {
      final result = await fetchData();
      runInAction(() {
        state.queryResult.addPageResult(result);
        state.fetchState = FetchState.fromIterable(result.records);
      });
    } catch (e, s) {
      print(e);
      print(s);
      runInAction(() {
        state.fetchState = FetchState.error;
      });
    }
  }

  void reorder(int oldIndex, int newIndex) {
    runInAction(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      List<T> newList = [];
      newList.addAll(state.queryResult.records);
      final item = newList.removeAt(oldIndex);
      newList.insert(newIndex, item);
      state.queryResult.records = newList;
    });
  }
}
