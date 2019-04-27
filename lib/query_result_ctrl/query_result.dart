import 'package:fluttered/query_result/query_result.dart' as query_result
    show QueryResult;
import 'package:mobx/mobx.dart';

part 'package:fluttered/query_result_ctrl/query_result.g.dart';

class QueryResult<T> = query_result.QueryResult<T> with _$QueryResult<T>;
