import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_game_1/ui/game_data.dart';
import 'package:flutter_game_1/ui/lives_ui_component.dart';

class LivesUi extends PositionComponent with HasGameRef {
  late GameData gameData;

  List<LivesUiComponent> lives = [];

  LivesUi(this.gameData);

  @override
  FutureOr<void> onLoad() {
    for (int i = 0; i < gameData.lives; i++) {
      lives.add(LivesUiComponent());
      game.camera.viewport.add(lives[i]);
      lives[i].position = Vector2(
        game.size.x - (i * (lives[i].width + 50) + 50),
        30,
      );
    }
    return super.onLoad();
  }

  void reset(GameData data) {
    gameData = data;
    for (int i = 0; i < gameData.lives; i++) {
      lives.add(LivesUiComponent());
      game.camera.viewport.add(lives[i]);
      lives[i].position = Vector2(
        game.size.x - (i * (lives[i].width + 50) + 50),
        30,
      );
    }
  }

  void loselives() {
    if (lives.isNotEmpty) {
      lives[lives.length - 1].removeFromParent();
      lives.removeLast();
    }
  }
}
