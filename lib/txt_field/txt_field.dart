import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttered/field_state/field_actions.dart';
import 'package:fluttered/field_state/field_state.dart';
import 'package:mobx/mobx.dart';

class TxtField extends StatefulWidget {
  final FieldActions<String> actions;
  final Widget Function(TextEditingController controller, BuildContext context) builder;

  const TxtField({Key key, @required this.actions, @required this.builder}) : super(key: key);

  State<StatefulWidget> createState() => TxtFieldState();
}

class TxtFieldState extends State<TxtField> {
  TextEditingController _controller = TextEditingController();
  FieldActions<String> get actions => widget.actions;
  FieldState<String> get state => actions.state;

  void initState() {
    super.initState();
    _controller.text = state.value;

    _controller.addListener(() {
      actions.changeValue(_controller.text);
    });

    reaction((_) => state.value, (newText) {
      if (newText != _controller.text) {
        _controller.text = newText;
      }
    });
  }

  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return widget.builder(_controller, context);
      },
    );
  }
}
