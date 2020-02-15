import 'package:flutter/material.dart';

class PreviewList extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  PreviewList({this.child, this.onPressed});

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        child,
        ButtonBarTheme(
          data: ButtonBarThemeData(),
          // make buttons use the appropriate styles for cards
          child: ButtonBar(
            children: <Widget>[
              FlatButton(child: const Text('SHOW MORE'), onPressed: onPressed),
            ],
          ),
        ),
      ],
    );
  }
}
