import 'package:flutter/material.dart';

class Credit extends StatelessWidget {
  const Credit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "Créditos",
            style: theme.textTheme.titleMedium,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Pelo desenvolvimento da aplicação e elaboração das mensagens: "),
            Text(
              "Turma 3H3 - Desenvolvimento de Sistemas",
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Pela elaboração da arte do Sylvinho e de sua animação de fala: "),
            Text(
              "Fulvio Enzo Ignacio - email: efulvio3@gmail.com / instagram: @fulvitoz",
              style: theme.textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}
