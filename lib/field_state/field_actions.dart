import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'field_state.dart';

class FieldActions<T> {
  final FieldState<T> state;

  FieldActions({@required this.state});

  void changeValue(T value) {
    runInAction(() {
      state.value = value;
    });
  }
}
