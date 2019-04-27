import 'package:flutter/material.dart';
import 'package:dartla_util/dartla_util.dart';

class ScrollBuilder extends StatefulWidget {
  final Fun2<Widget, BuildContext, ScrollController> builder;
  final Fun1<void, ScrollController> onInit;

  ScrollBuilder({this.builder, this.onInit}) : assert(builder != null);

  State createState() {
    return new _ScrollBuilder();
  }
}

class _ScrollBuilder extends State<ScrollBuilder> {
  ScrollController controller = new ScrollController();

  void initState() {
    super.initState();
    widget.onInit?.call(controller);
  }

  Widget build(BuildContext context) {
    return this.widget.builder(context, controller);
  }
}
