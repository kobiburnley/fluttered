import 'package:fluttered/fetch_state/fetchState.dart';
import 'package:fluttered/pagination/pagination.dart';
import 'package:fluttered/query_result/query_result.dart';


class BrowseState<T> {
  FetchState fetchState;
  QueryResult<T> queryResult;
  Pagination pagination;
  Map<String, String> filters;

  BrowseState(
      {this.fetchState, this.queryResult, this.pagination, this.filters});

  BrowseState.empty()
      : this(
      fetchState: FetchState.noData,
      queryResult: QueryResult.empty(),
      pagination: Pagination(limit: 10, page: 1),
      filters: {}
  );

  BrowseState<T> reset() {
    return this
      ..queryResult.clear();
  }
}
