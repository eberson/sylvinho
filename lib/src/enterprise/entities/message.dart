class Message {
  final String content;
  final DateTime moment;

  Message({
    required this.content,
    required this.moment,
  });

  factory Message.fromMessage(String message) {
    return Message(
      content: message,
      moment: DateTime.now(),
    );
  }
}
