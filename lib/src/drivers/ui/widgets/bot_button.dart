import 'package:flutter/material.dart';

class BotButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BotButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
