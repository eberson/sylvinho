import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/configuration_view_model.dart';
import 'package:sylvinho/src/drivers/ui/widgets/bot_button.dart';

class APIKeyInputDialog extends StatelessWidget {
  const APIKeyInputDialog._();

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const APIKeyInputDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ConfigurationViewModel>(context);

    final theme = Theme.of(context);
    final controller = TextEditingController(text: vm.configuration?.apiKey ?? "");

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.colorScheme.background),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'API Key',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BotButton(
                  text: 'Confirmar',
                  onPressed: () {
                    vm.updateAPIKey(controller.text);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
