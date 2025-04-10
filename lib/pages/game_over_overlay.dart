import 'package:flutter/material.dart';
import 'package:flutter_game_1/pages/my_flame_game.dart';

// ignore: must_be_immutable
class GameOverOverlay extends StatelessWidget {
  MyFlameGame game;
  GameOverOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: game.size.x * 0.5,
        height: game.size.x * 0.5,

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color.fromARGB(55, 55, 55, 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  'Play Again',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {
    game.reset();
  }
}
