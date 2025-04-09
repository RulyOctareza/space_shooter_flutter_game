import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flutter_game_1/components/bullets.dart';

class Ship extends SpriteComponent with HasGameRef {
  late Vector2 tujuan;
  late Vector2 arah;
  double speed = 2.0;
  double shootCooldown = 10;
  double shootTimer = 0;

  bool isShooting = false;

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

    if ((tujuan - position).length < speed) {
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }
}
