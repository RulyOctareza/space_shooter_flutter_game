import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_game_1/components/asteroid.dart';

class Bullets extends SpriteComponent with HasGameRef, CollisionCallbacks {
  TapDownInfo info;
  late Vector2 arah;
  double speed = 10;

  double ttl = 100;

  Bullets(position, this.info) : super(position: position) {
    arah = info.eventPosition.global - position;
    arah = arah.normalized();
    priority = 1;
    lookAt(info.eventPosition.global);
  }

  @override
  void update(double dt) {
    ttl--;
    if (ttl < 0) {
      removeFromParent();
    }
    position.add(arah * speed);
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Asteroid) {
      removeFromParent();
    }
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('bullets/spaceMissiles_015.png');
    add(RectangleHitbox(collisionType: CollisionType.active));
    return super.onLoad();
  }
}
