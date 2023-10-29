

class ChatEvent {
  final String message;

  ChatEvent({
    required this.message,
  });

  factory ChatEvent.empty() {
    return ChatEvent(
        message: "Não consigo responder. Verifique se não estou com uma chave de api inválida. Do contrário, formule uma nova pergunta, por favor.",
    );
  }
}
