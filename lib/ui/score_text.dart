import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/ui/game_data.dart';

class ScoreText extends PositionComponent with HasGameRef {
  late TextComponent scoreText;

  GameData data;

  ScoreText(this.data);

  @override
  FutureOr<void> onLoad() {
    scoreText = TextComponent(
      position: Vector2(10, 10),
      text: 'Score: ${data.score}',
      textRenderer: TextPaint(
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
    game.camera.viewport.add(scoreText);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    scoreText.text = 'Score: ${data.score}';

    super.update(dt);
  }
}
