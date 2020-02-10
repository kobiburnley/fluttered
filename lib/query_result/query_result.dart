// ignore: implementation_imports
import 'package:dartla_util/src/universal_resource/query_result.dart' as Universal;

class QueryResult<T> implements Universal.QueryResult<T> {
  List<T> records;
  int total;

  QueryResult.empty() : this(records: [], total: 0);

  QueryResult({this.records, this.total});

  QueryResult.copy(QueryResult<T> other)
      : this(records: other.records, total: other.total);

  QueryResult.fromList(List<T> list)
      : this(records: list, total:list.length);

  QueryResult<T> clear() {
    return this
      ..total = 0
      ..records = [];
  }

  QueryResult<T> addPageResult(QueryResult<T> other) {
    return this
      ..total = total + other.total
      ..records.addAll(other.records);
  }
}
