import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:sylvinho/src/drivers/ui/domain/configuration_view_model.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/widgets/api_key_input_dialog.dart';
import 'package:sylvinho/src/drivers/ui/widgets/bot_button.dart';

class ConfigPage extends StatefulWidget implements BottomAccessScreen {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Configurações",
      );

  @override
  Widget screen() => this;
}

class _ConfigPageState extends State<ConfigPage> {
  final _controller = TextEditingController();
  final _qrCodeScanner = QrBarCodeScannerDialog();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Configurações"),
        ),
        SliverToBoxAdapter(
          child: body(context),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    final viewModel = Provider.of<ConfigurationViewModel>(context);

    _controller.text = (viewModel.configuration?.apiKey ?? "");

    const spacer = SizedBox(
      height: 50,
    );

    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "API Key",
            ),
            enabled: false,
          ),
          spacer,
          BotButton(
            text: "Ler QRCode",
            onPressed: () => _qrCodeScanner.getScannedQrBarCode(
              context: context,
              onCode: (code) {
                if (code != null) {
                  viewModel.updateAPIKey(code);
                }
              },
            ),
          ),
          spacer,
          BotButton(text: "Informar API Key", onPressed: () => APIKeyInputDialog.show(context)),
        ],
      ),
    );
  }
}
