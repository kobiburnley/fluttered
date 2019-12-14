import 'dart:async';

import 'package:meta/meta.dart';

abstract class StackNav {
  Future<T> push<T extends Object>({
    @required String name,
    Object arguments,
    bool fullscreenDialog,
  });

  bool pop<T extends Object>([T result]);

  void popUntil(String name);

  Future<T> pushAndRemoveUntil<T extends Object>({
    @required String name,
    @required String until,
    Object arguments,
    bool fullscreenDialog,
  });
}
