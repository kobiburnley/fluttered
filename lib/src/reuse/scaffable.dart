
import 'package:flutter/material.dart';

class Scaffable extends StatelessWidget {
  final bool scaff;
  final PreferredSizeWidget appBar;
  final Widget body;

  Scaffable({this.scaff, this.appBar, this.body});

  Widget build(BuildContext context) {
    Widget child = body;
    if(scaff) {
      child = new Scaffold(
        appBar: appBar,
        body: child,
      );
    }
    return child;
  }
}
