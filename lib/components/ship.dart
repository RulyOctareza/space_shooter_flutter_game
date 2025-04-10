import 'dart:async';
import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/rendering.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_game_1/components/bullets.dart';
import 'package:flutter_game_1/components/explosion.dart';
import 'package:flutter_game_1/pages/my_flame_game.dart';

class Ship extends SpriteComponent
    with HasGameRef<MyFlameGame>, CollisionCallbacks {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 2.0;
  double shootCooldown = 10;
  double shootTimer = 0;

  double hitTimer = 0;
  double hitCooldown = 20;
  bool isShooting = false;
  bool isBeingHit = false;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if ((isBeingHit == false) && (other is! Bullets)) {
      isBeingHit = true;
      decorator.addLast(PaintDecorator.tint(Color.fromARGB(155, 120, 204, 37)));
      decorator.addLast(PaintDecorator.blur(10));
      game.loselife();

      game.add(Explosion(intersectionPoints.first, Vector2(0.7, 0.7)));

      FlameAudio.play("assets/audio/EXPLDsgn_Explosion Impact_14.wav");
    }

    super.onCollision(intersectionPoints, other);
  }

  Ship() {
    arah = Vector2(0, 0);
    tujuan = position;
    priority = 2;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global;
    arah = tujuan - position;
    lookAt(tujuan);
    angle += pi;
    arah = arah.normalized();
  }

  void shoot(TapDownInfo info) {
    // if (isShooting == false) {

    // }
    Bullets bBaru = Bullets(position, info);
    game.add(bBaru);

    isShooting = true;

    lookAt(info.eventPosition.global);
    angle += pi;
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load('ships/spaceShips_001.png'));
    position = Vector2(100, 100);
    angle = -pi / 2;
    anchor = Anchor.center;
    add(
      CircleHitbox(
        radius: sprite!.image.width / 2,
        collisionType: CollisionType.active,
      ),
    );
  }

  @override
  void update(double dt) {
    if (isShooting = true) {
      shootTimer++;
      if (shootTimer > shootCooldown) {
        shootTimer = 0;
        isShooting = false;
      }
    }

    if (isBeingHit) {
      hitTimer++;
      if (hitTimer > hitCooldown) {
        hitTimer = 0;
        isBeingHit = false;
        decorator.removeLast();
        decorator.removeLast();
      }
    }

    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }
}
