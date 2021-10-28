import 'dart:math';

class PlayerModel {
  static const GRAVITY = 9.8;

  double currentHeight = 0;
  int jumpCounter = 0;
  double verticalSpeed = 0;

  void jump() {
    if (jumpCounter < 2) {
      jumpCounter++;
      verticalSpeed = sqrt(2 * GRAVITY);
    }
  }

  void update(double t) {
    verticalSpeed -= t * GRAVITY;
    currentHeight += t * verticalSpeed;

    if (currentHeight <= 0) {
      currentHeight = 0;
      verticalSpeed = 0;
      jumpCounter = 0;
    }
  }
}