import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Sylvinho extends StatefulWidget {
  final AnimationController controller;

  const Sylvinho({
    super.key,
    required this.controller,
  });

  @override
  State<Sylvinho> createState() => _SylvinhoState();
}

class _SylvinhoState extends State<Sylvinho> with TickerProviderStateMixin {
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    // widget.controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     widget.controller.reset();

    //     Future.delayed(const Duration(seconds: 5), () {
    //       widget.controller.forward();
    //     });
    //   }
    // });

    _composition = AssetLottie('assets/lottie/sylvinho_talking.json').load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final composition = snapshot.data!;  

          widget.controller.duration = composition.duration; 
          
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
