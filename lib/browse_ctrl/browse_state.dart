import 'package:mobx/mobx.dart';

import '../browse_state/browse_state.dart' as browse_state show BrowseState;
import '../fetch_state/fetchState.dart';
import '../pagination/pagination.dart';
import 'package:fluttered/query_result_ctrl/query_result.dart';

part 'browse_state.g.dart';

class BrowseState<T> extends browse_state.BrowseState<T> with _$BrowseState<T> {
  BrowseState({FetchState fetchState,
    QueryResult<T> queryResult,
    Pagination pagination,
    Map<String, String> filters,
  })
      : super(
      fetchState: fetchState,
      queryResult: QueryResult.copy(queryResult),
      pagination: pagination,
      filters: filters
  );

  BrowseState.empty({List<T> selected})
      : this(
      fetchState: FetchState.noData,
      queryResult: QueryResult.fromList(selected ?? []),
      pagination: Pagination(limit: 10, page: 1),
      filters: {}
  );
}
