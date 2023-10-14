import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/ConfigurationViewModel.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/widgets/api_key_input_dialog.dart';
import 'package:sylvinho/src/drivers/ui/widgets/bot_button.dart';

class ConfigPage extends StatelessWidget implements BottomAccessScreen {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConfigurationViewModel>(context);
    final controller = TextEditingController(text: viewModel.configuration?.apiKey);

    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "API Key",
            ),
            enabled: false,
          ),
          BotButton(text: "Ler QRCode", onPressed: (){}),
          BotButton(text: "Informar API Key", onPressed: () => APIKeyInputDialog.show(context)),
        ],
      ),
    );
  }

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Configurações",
      );

  @override
  Widget screen() => this;
}
