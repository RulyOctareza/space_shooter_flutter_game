import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/components/asteroid_spawner.dart';
import 'package:flutter_game_1/components/bg_parallax_component.dart';
import 'package:flutter_game_1/components/ship.dart';
import 'package:flutter_game_1/ui/game_data.dart';
import 'package:flutter_game_1/ui/lives_ui.dart';
import 'package:flutter_game_1/ui/score_text.dart';

class MyFlameGame extends FlameGame
    with PanDetector, TapDetector, HasCollisionDetection {
  late Ship s;
  late BgParallaxComponent bgParallax;
  late AsteroidSpawner asp;
  late GameData data;
  late ScoreText scoreText;
  late LivesUi livesUi;

  void reset() {
    resumeEngine();
    overlays.remove('GameOver');
    data = GameData(0, 3);
    livesUi.reset(data);
    scoreText.reset(data);
  }

  void addScore(int score) {
    data.addScore(score);
  }

  @override
  Color backgroundColor() {
    return Colors.blueGrey;
  }

  @override
  FutureOr<void> onLoad() async {
    data = GameData(0, 3);
    bgParallax = BgParallaxComponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);

    scoreText = ScoreText(data);
    add(scoreText);

    livesUi = LivesUi(data);
    add(livesUi);

    pauseEngine();
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  void loselife() {
    data.loselives();
    livesUi.loselives();
    if (data.lives <= 0) {
      //game over
      overlays.add('GameOver');
      pauseEngine();
    }
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
  }

  @override
  void onTapDown(TapDownInfo info) {
    s.shoot(info);
    super.onTapDown(info);
  }
}
