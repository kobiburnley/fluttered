import 'package:flutter/material.dart';
import 'package:dartla_util/dartla_util.dart';

class Lifecycle extends StatefulWidget {
  final Widget child;
  final Fun1<void, BuildContext> onInit;
  final Fun<void> onDispose;

  Lifecycle({this.child, this.onInit, this.onDispose}) : assert(child != null);

  State createState() {
    return _Lifecycle();
  }
}

class _Lifecycle extends State<Lifecycle> {
  void initState() {
    super.initState();
    widget.onInit?.call(context);
  }

  void dispose() {
    super.dispose();
    widget.onDispose?.call();
  }

  Widget build(BuildContext context) {
    return widget.child;
  }
}
