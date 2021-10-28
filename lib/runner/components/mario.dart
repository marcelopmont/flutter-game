import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:flame/spritesheet.dart';
import 'package:flutter/widgets.dart';
import 'package:game_example/runner/components/ground.dart';

class Mario {
  static const SIZE = 0.08; // * screenWidth
  static const JUMP_HEIGHT = 0.19; // * screenWidth
  static const X_POSITION = 0.1; // * screenWidth

  late double imageHeight;
  late double imageWidth;

  double screenWidth;
  double screenHeight;

  Rect? marioRect;
  AnimationComponent? marioRunning;
  Sprite marioJumping = Sprite('mario_jumping.png');

  Mario({
    required this.screenWidth,
    required this.screenHeight,
  }){

    imageWidth = screenWidth * SIZE;
    imageHeight = imageWidth * 1.5;

    final spritesheet = SpriteSheet(
      imageName: 'mario_running.png',
      textureHeight: 188,
      textureWidth: 134,
      columns: 2,
      rows: 1,
    );

    final marioAnimation = spritesheet.createAnimation(0, stepTime: 0.2);
    marioRunning = AnimationComponent(0, 0, marioAnimation);
  }

  void render(Canvas canvas, double playerHeight) {
    marioRect = Rect.fromLTWH(
      screenWidth * X_POSITION,
      screenHeight * (1 - Ground.HEIGHT) - imageHeight - (playerHeight * JUMP_HEIGHT * screenWidth),
      imageWidth,
      imageHeight,
    );

    if (playerHeight > 0) {
      marioJumping.renderRect(canvas, marioRect);
    } else {
      marioRunning?.setByRect(marioRect);
      marioRunning?.render(canvas);
    }
  }

  void update(double t) {
    marioRunning?.update(t);
  }
}
