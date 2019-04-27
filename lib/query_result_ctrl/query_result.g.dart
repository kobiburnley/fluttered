part of 'query_result.dart';

mixin _$QueryResult<T> on query_result.QueryResult<T> {
  Atom _total = new Atom();

  int get total {
    _total.reportObserved();
    return super.total;
  }

  set total(int total) {
    super.total = total;
    _total.reportChanged();
  }

  Atom _records = new Atom();

  List<T> get records {
    _records.reportObserved();
    return super.records;
  }

  set records(List<T> records) {
    super.records = records;
    _records.reportChanged();
  }
}
