import 'package:meta/meta.dart';

class Message {
  final String title;
  final String content;
  final MessageType type;

  Message({
    @required this.title,
    @required this.content,
    @required this.type,
  });

  Message.warning({
    String title = '',
    String content = '',
  }) : this(
          title: title,
          content: content,
          type: MessageType.warning,
        );
}

enum MessageType { info, success, warning, danger }
