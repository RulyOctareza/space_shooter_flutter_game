import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/pages/my_flame_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: GameWidget(game: MyFlameGame(),));

  }
}
