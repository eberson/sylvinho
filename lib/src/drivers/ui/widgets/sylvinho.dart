import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Sylvinho extends StatefulWidget {
  final AnimationController controller;
  final VoidCallback onAnimationLoaded;

  const Sylvinho({
    super.key,
    required this.controller,
    required this.onAnimationLoaded,
  });

  @override
  State<Sylvinho> createState() => _SylvinhoState();
}

class _SylvinhoState extends State<Sylvinho> with TickerProviderStateMixin {
  late final Future<LottieComposition> _composition;

  bool loaded = false;

  @override
  void initState() {
    super.initState();

    _composition = AssetLottie('assets/lottie/sylvinho_talking.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final composition = snapshot.data!;

          if (!loaded) {
            widget.onAnimationLoaded();
            widget.controller.duration = composition.duration;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                loaded = true;
              });
            });
          }
          
          return Lottie(
            composition: composition,
            fit: kIsWeb ? BoxFit.fitWidth : BoxFit.fitHeight,
            controller: widget.controller,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );    
  }
}
