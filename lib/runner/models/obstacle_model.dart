import 'dart:math';

import 'package:game_example/runner/runner_game.dart';

class ObstacleModel {
  double xPosition = 1;

  ObstacleModel(this.xPosition);

  void update(double t) {
    xPosition -= t * RunnerGame.GAME_SPEED;

    if(xPosition < -0.2) {
      xPosition = 1 + Random().nextDouble() / 3;
    }
  }
}