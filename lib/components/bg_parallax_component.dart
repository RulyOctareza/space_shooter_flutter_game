import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_game_1/components/ship.dart';

class BgParallaxComponent extends ParallaxComponent with HasGameRef {
  final _parallelImage = [
    ParallaxImageData('parallax/bkgd_0.png'),
    ParallaxImageData('parallax/bkgd_1.png'),
    ParallaxImageData('parallax/bkgd_2.png'),
    ParallaxImageData('parallax/bkgd_3.png'),
    ParallaxImageData('parallax/bkgd_4.png'),
    ParallaxImageData('parallax/bkgd_5.png'),
    ParallaxImageData('parallax/bkgd_6.png'),
  ];

  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallax(
      _parallelImage,
      baseVelocity: Vector2(10, 0),
      velocityMultiplierDelta: Vector2(1.5, 1.5),
      repeat: ImageRepeat.repeat,
    );
  }

  void changeSpeed(Vector2 arah) {
    parallax!.baseVelocity = arah;
  }

  void changeSpeedBasedShip(Ship player) {
    if (parallax != null) {
      parallax!.baseVelocity = player.arah * 5;
    }
  }
}
