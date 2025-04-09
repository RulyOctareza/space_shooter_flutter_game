import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter_game_1/components/asteroid.dart';

class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;

  @override
  FutureOr<void> onLoad() {
    Random r = Random();

    double margin = 20;
    spawner = SpawnComponent(
      period: 1,
      factory: (idx) {
        return Asteroid(ukuran: r.nextDouble() * 0.3 + 0.1);
      },
      autoStart: true,
      area: Rectangle.fromLTWH(
        margin,
        margin,
        game.size.x - 2 * margin,
        game.size.y - 2 * margin,
      ),
      within: true,
    );
    game.add(spawner);
    return super.onLoad();
  }
}
