import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:game_example/runner/components/ground.dart';

class Goomba {
  static const SIZE = 0.07; // * screenWidth

  Sprite goombaSprite = Sprite('goomba.png');
  Rect? goombaRect;
  late double imageSize;

  double screenWidth;
  double screenHeight;

  Goomba({
    required this.screenWidth,
    required this.screenHeight,
  }) {
    imageSize = screenWidth * SIZE;
  }

  void render(Canvas canvas, double obstaclePosition) {
    goombaRect = Rect.fromLTWH(
      screenWidth * obstaclePosition,
      screenHeight * (1 - Ground.HEIGHT) - imageSize,
      imageSize,
      imageSize,
    );
    goombaSprite.renderRect(canvas, goombaRect);
  }
}