import 'package:flutter/material.dart';
import 'package:fluttered/src/state/fetchState.dart';

class ProgressBuilder extends StatelessWidget {
  final FetchState fetchState;
  final Widget child;

  ProgressBuilder({this.fetchState, this.child})
      : assert(fetchState != null),
        assert(child != null);

  @override
  Widget build(BuildContext context) {
    if (fetchState.isLoading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }

    if (fetchState.isNoData) {
      return new Center(
        child: new Text('Nothing found'),
      );
    }

    if (fetchState.isError) {
      return new Center(
        child: new Icon(Icons.error),
      );
    }

    return child;
  }
}
