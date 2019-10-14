import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttered/field_state/field_actions.dart';
import 'package:fluttered/field_state/field_state.dart';
import 'package:mobx/mobx.dart';

class ReadOnlyTextField<T> extends StatefulWidget {
  final FieldActions<T> actions;
  final String Function(T value) stringify;
  final Widget Function(TextEditingController controller, BuildContext context) builder;

  const ReadOnlyTextField({Key key, @required this.actions, @required this.builder, @required this.stringify}) : super(key: key);

  State<StatefulWidget> createState() => ReadOnlyTextFieldState<T>();
}

class ReadOnlyTextFieldState<T> extends State<ReadOnlyTextField<T>> {
  TextEditingController _controller = TextEditingController();
  FieldActions<T> get actions => widget.actions;
  FieldState<T> get state => actions.state;

  void initState() {
    super.initState();
    _controller.text = widget.stringify(state.value);

    reaction((_) => state.value, (T newText) {
      if (newText != _controller.text) {
        _controller.text = widget.stringify(newText);
      }
    });
  }

  Widget build(BuildContext context) {
    return widget.builder(_controller, context);
  }
}
