import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/config/routes.dart';
import 'package:sylvinho/src/drivers/ui/config/themes.dart';
import 'package:sylvinho/src/drivers/ui/domain/configuration_view_model.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ConfigurationViewModel.makeProvider(),
        ConversationViewModel.makeProvider(),
      ],
      child: MaterialApp(
        title: "Sylvinho",
        theme: Themes.defaultTheme,
        initialRoute: Routes.initial,
        routes: Routes.routes,
      ),
    );
  }
}
