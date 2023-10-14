import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Sobre o Sylvinho'),
        ),
        const SliverToBoxAdapter(
          child: Text('Esse aplicativo foi elaborado pela turma do 3H3 como projeto para apresentação na Feira Tecnológica de 2023'),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Agradecimentos e Créditos',
                style: theme.textTheme.headlineMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
