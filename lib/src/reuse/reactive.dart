import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

// ignore:implementation_imports
import 'package:mobx/src/core.dart' show ReactionImpl;

typedef BuildObserved = Widget Function(BuildContext);

class Reactive extends StatefulWidget {
  const Reactive({@required this.builder, @required this.onInvalidate, Key key, this.context})
      : assert(builder != null),
        super(key: key);

  final ReactiveContext context;
  final BuildObserved builder;
  final ValueChanged<bool> onInvalidate;

  @visibleForTesting
  Reaction createReaction(Function() onInvalidate) =>
      ReactionImpl(context ?? mainContext, onInvalidate);

  @override
  State<Reactive> createState() => ReactiveState();
}

class ReactiveState extends State<Reactive> {
  ReactionImpl _reaction;

  @override
  void initState() {
    super.initState();
    _reaction = widget.createReaction(() {
      widget.onInvalidate(false);
    });
    _reaction.track(() {
      widget.onInvalidate(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  @override
  void dispose() {
    _reaction.dispose();
    super.dispose();
  }
}
