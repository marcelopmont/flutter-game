import 'package:game_example/runner/models/obstacle_model.dart';
import 'package:game_example/runner/models/player_model.dart';
import 'package:game_example/runner/runner_game.dart';
import 'package:get/get.dart';

class RunnerController extends GetxController {
  PlayerModel player = PlayerModel();
  List<ObstacleModel> obstacles = [];

  final distance = Rx<double>(0);

  @override
  void onInit() {
    super.onInit();

    _startGame();
  }

  void _startGame() {
    distance.value = 0;
    player = PlayerModel();
    obstacles = [
      ObstacleModel(1),
      ObstacleModel(1.5),
    ];
  }

  void onUpdate(double t) {
    distance.value += RunnerGame.GAME_SPEED * t;

    player.update(t);
    obstacles.forEach((obstacle) {
      obstacle.update(t);
    });
  }

  void onScreenTap() {
    player.jump();
  }

  void onObstacleCollision() async {
    _startGame();
  }
}