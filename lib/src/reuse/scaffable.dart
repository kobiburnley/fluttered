
import 'package:flutter/material.dart';

class Scaffable extends StatelessWidget {
  final bool scaff;
  final PreferredSizeWidget appBar;
  final Widget body;

  Scaffable({this.scaff, this.appBar, this.body});

  Widget build(BuildContext context) {
    Widget child = body;
    if (scaff) {
      child = new Scaffold(
        appBar: appBar,
        body: child,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        child,
        ButtonTheme.bar(
          // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('SHOW MORE'),
                onPressed: () {/* ... */},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
