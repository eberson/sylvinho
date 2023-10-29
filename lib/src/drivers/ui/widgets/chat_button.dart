import 'package:flutter/material.dart';

class ChatButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ChatButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<ChatButton> createState() => _ChatButtonState();
}

const _externalSize = 100.0;
const _internalSize = 60.0;
const _internalRadius = 30.0;

class _ChatButtonState extends State<ChatButton> {
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _externalSize,
      height: _externalSize,
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: _internalSize,
        height: _internalSize,
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_internalRadius),
          child: GestureDetector(
            onTap: (){},
            child: const CircleAvatar(
              radius: _internalRadius,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.keyboard,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
