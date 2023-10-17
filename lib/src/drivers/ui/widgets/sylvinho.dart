import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sylvinho extends StatefulWidget {
  const Sylvinho({super.key});

  @override
  State<Sylvinho> createState() => _SylvinhoState();
}

class _SylvinhoState extends State<Sylvinho> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/sylvinho_talking.json',
      controller: _controller,
      repeat: true,
      fit: BoxFit.fitHeight,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
        _controller.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reset();

            Future.delayed(const Duration(seconds: 5), (){
              _controller.forward();
            });
          }
        });

        Future.delayed(const Duration(seconds: 10), (){
          _controller.forward();
        });
      },
    );
  }
}
