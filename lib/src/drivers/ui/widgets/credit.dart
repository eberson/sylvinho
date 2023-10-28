import 'package:flutter/material.dart';

class Credit extends StatelessWidget {
  const Credit({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Créditos",
              style: theme.textTheme.titleMedium,
            ),
          ),
          const Text(
            "Pelo desenvolvimento da aplicação e elaboração das mensagens: ",
            textAlign: TextAlign.center,
          ),
          Text(
            "Turma 3H3 - Desenvolvimento de Sistemas",
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Pela elaboração da arte do Sylvinho e de sua animação de fala: ",
            textAlign: TextAlign.center,
          ),
          Text(
            "Fulvio Enzo Ignacio - email: efulvio3@gmail.com / instagram: @fulvitoz",
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
