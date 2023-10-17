import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Sylvinho extends StatefulWidget {
  const Sylvinho({super.key});

  @override
  State<Sylvinho> createState() => _SylvinhoState();
}

class _SylvinhoState extends State<Sylvinho> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();

        Future.delayed(const Duration(seconds: 5), () {
          _controller.forward();
        });
      }
    });

    _composition = AssetLottie('assets/lottie/sylvinho_talking.json').load();
  }

  @override
  void dispose() {
    _controller.dispose();    

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LottieComposition>(
      future: _composition,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final composition = snapshot.data!;   
          
          Future.delayed(const Duration(seconds: 5), () {
            setState(() {
              if (_controller.duration == null) {
                _controller.duration = composition.duration;
                _controller.forward();
              }              
            });            
          });

          return Lottie(
            composition: composition,
            fit: kIsWeb ? BoxFit.fitWidth : BoxFit.fitHeight,
            controller: _controller,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // return Lottie.asset(
    //   'assets/lottie/sylvinho_talking.json',
    //   controller: _controller,
    //   repeat: true,
    //   fit: kIsWeb ? BoxFit.fitWidth : BoxFit.fitHeight,
    //   onLoaded: (composition) {
    //     _controller.duration = composition.duration;
    //     _controller.addStatusListener((status) {
    //       if (status == AnimationStatus.completed) {
    //         _controller.reset();

    //         Future.delayed(const Duration(seconds: 3), (){
    //           _controller.forward();
    //         });
    //       }
    //     });

    //     Future.delayed(const Duration(seconds: 3), (){
    //       _controller.forward();
    //     });
    //   },
    // );
  }
}
