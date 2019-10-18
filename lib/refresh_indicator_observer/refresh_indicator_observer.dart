import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class RefreshIndicatorObserver extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final bool Function(Reaction) predicate;
  final Widget Function(
      BuildContext context,
      GlobalKey<RefreshIndicatorState> key,
      Future<void> Function() onRefresh) builder;

  const RefreshIndicatorObserver(
      {Key key,
      @required this.predicate,
      @required this.builder,
      @required this.onRefresh})
      : super(key: key);

  @override
  _RefreshIndicatorObserverState createState() =>
      _RefreshIndicatorObserverState();
}

class _RefreshIndicatorObserverState extends State<RefreshIndicatorObserver> {
  GlobalKey<RefreshIndicatorState> _key = GlobalKey();
  Completer<Null> completer;
  ReactionDisposer reactionDisposer;
  bool fromUser = false;

  void initState() {
    super.initState();

    reactionDisposer = reaction(widget.predicate, (show) {
      // show=true && not showing already
      if (show && completer == null && !fromUser) {
        completer = Completer();
        _key.currentState.show();
      } else if (completer != null) {
        completer.complete();
        completer = null;
      }
    });
  }

  void dispose() {
    reactionDisposer?.call();
    super.dispose();
  }

  Future<void> onRefresh() async {
    if (completer != null) {
      // from reaction
      await completer.future;
    } else {
      // from user
      fromUser = true;
      await widget.onRefresh();
      fromUser = false;
    }
  }

  Widget build(BuildContext context) {
    return widget.builder(context, _key, onRefresh);
  }
}
