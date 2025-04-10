import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_game_1/components/blast_particle.dart';
import 'package:flutter_game_1/components/bullets.dart';
import 'package:flutter_game_1/components/ship.dart';
import 'package:flutter_game_1/pages/my_flame_game.dart';

class Asteroid extends SpriteComponent
    with HasGameRef<MyFlameGame>, CollisionCallbacks {
  double ukuran = 0.5;
  late Vector2 arah;
  late double speed;

  Asteroid({required this.ukuran}) {
    scale = Vector2(ukuran, ukuran);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bullets || other is Ship) {
      game.add(BlastParticle(position, ukuran));
      game.addScore(10);
      removeFromParent();
      FlameAudio.play("assets/audio/EXPLDsgn_Implode_15.wav");
    }
    // print('terjadi tubrukan !');
    super.onCollision(intersectionPoints, other);
  }

  @override
  Future<void> onLoad() async {
    sprite = await game.loadSprite('meteor/spaceMeteors_001.png');
    add(RectangleHitbox(collisionType: CollisionType.passive));
    // anchor = Anchor.center;

    Random r = Random();

    double x = r.nextDouble() * 2 - 1;
    double y = r.nextDouble() * 2 - 1;

    arah = Vector2(x, y);
    speed = r.nextDouble() * 200 + 50;

    // position = Vector2(game.size.x / 2, game.size.y / 2);
    // scale = Vector2(0.4, 0.4);
  }

  @override
  void update(double dt) {
    position.add(arah * speed * dt);

    if (position.x < 0 ||
        position.x > game.size.x ||
        position.y < 0 ||
        position.y > game.size.y) {
      removeFromParent();
    }
    super.update(dt);
  }
}
