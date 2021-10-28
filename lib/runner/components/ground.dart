import 'dart:math';

import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_example/runner/runner_game.dart';

class Ground {
  static const HEIGHT = 0.20;
  static const GRASS_ASPECT_RATIO = 1.4649;

  List<Sprite> groundImages = [
    Sprite('fg_grass_0.png'),
    Sprite('fg_grass_1.png'),
    Sprite('fg_grass_2.png'),
  ];

  List<Rect> grassRects = [];
  List<int> grassImageIndex = [];

  double screenHeight;
  double screenWidth;
  late int grassCounter;

  Ground({
    required this.screenHeight,
    required this.screenWidth,
  }) {
    var grassHeight = screenHeight * HEIGHT;
    var grassWidth = grassHeight * GRASS_ASPECT_RATIO;

    grassCounter = screenWidth ~/ grassWidth + 2;

    for (var i = 0; i <= grassCounter; i++) {
      grassRects.add(Rect.fromLTWH(grassWidth * i, screenHeight - grassHeight - grassHeight * 0.18, grassWidth, grassHeight + (grassHeight * 0.18)));
      grassImageIndex.add(Random().nextInt(3));
    }
  }

  void render(Canvas canvas) {
    for (var i = 0; i <= grassCounter; i++) {
      groundImages[grassImageIndex[i]].renderRect(canvas, grassRects[i]);
    }
  }

  void update(double t) {
    for (var i = 0; i < grassRects.length; i++) {
      grassRects[i] = grassRects[i].translate(-t * RunnerGame.GAME_SPEED * screenWidth, 0);
      if (grassRects[i].right < 0) {
        grassRects[i] = grassRects[i].translate(grassCounter * grassRects[i].width, 0);
      }
    }
  }
}
