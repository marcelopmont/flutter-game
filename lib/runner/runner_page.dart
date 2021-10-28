import 'package:flutter/widgets.dart';
import 'package:game_example/runner/runner_controller.dart';
import 'package:game_example/runner/runner_game.dart';
import 'package:get/get.dart';

class RunnerPage extends StatelessWidget {
  const RunnerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<RunnerController>(RunnerController());

    return RunnerGame(controller: controller).widget;
  }
}
