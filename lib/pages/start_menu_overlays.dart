// ignore_for_file: must_be_immutable

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/pages/my_flame_game.dart';

class StartMenuOverlays extends StatelessWidget {
  MyFlameGame game;

  StartMenuOverlays(this.game, {super.key});

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
          color: Color.fromARGB(255, 19, 42, 86),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Space Shooter',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox(height: 15),
              Image.asset('assets/images/ships/spaceShips_009.png'),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  'Play Game',
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
    game.resumeEngine();
    game.overlays.remove('StartMenu');
    FlameAudio.bgm.play("Looping Ascent - Joel Cummins.mp3", volume: 0.4);
  }
}
