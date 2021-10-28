import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game_example/runner/components/background.dart';
import 'package:game_example/runner/components/goomba.dart';
import 'package:game_example/runner/components/ground.dart';
import 'package:game_example/runner/components/mario.dart';
import 'package:game_example/runner/runner_controller.dart';

class RunnerGame extends Game with TapDetector {
  static const GAME_SPEED = 0.4;

  RunnerController controller;

  Size screenSize = Size(0, 0);

  Mario? mario;
  Ground? ground;
  Background? background;
  List<Goomba>? obstacles;

  RunnerGame({required this.controller}) {
    _initialize();
  }

  void _initialize() async {
    resize(await Flame.util.initialDimensions());

    mario = Mario(screenWidth: screenSize.width, screenHeight: screenSize.height);
    ground = Ground(screenWidth: screenSize.width, screenHeight: screenSize.height);
    background = Background();

    obstacles = List.generate(
      2,
      (index) => Goomba(
        screenWidth: screenSize.width,
        screenHeight: screenSize.height,
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    background?.render(canvas);
    ground?.render(canvas);

    controller.obstacles.asMap().forEach((index, obstacle) {
      obstacles?[index].render(
        canvas,
        obstacle.xPosition,
      );
    });
    mario?.render(canvas, controller.player.currentHeight);
  }

  @override
  void update(double t) {
    mario?.update(t);
    ground?.update(t);
    controller.onUpdate(t);

    checkObstaclesCollision();
  }

  @override
  void resize(Size size) {
    this.screenSize = size;
  }

  @override
  void onTapDown(TapDownDetails d) {
    controller.onScreenTap();
  }

  void checkObstaclesCollision() {
    final playerCenter = mario?.marioRect?.center ?? Offset(0, 0);
    obstacles?.forEach((obstacle) {
      final obstacleCenter = obstacle.goombaRect?.center ?? Offset(0, 0);
      final minDistance = mario!.imageHeight / 2 + obstacle.imageSize / 2;
      if (playerCenter != Offset(0, 0) && obstacleCenter != Offset(0, 0) && (playerCenter - obstacleCenter).distance <= minDistance) {
        controller.onObstacleCollision();
      }
    });
  }
}
