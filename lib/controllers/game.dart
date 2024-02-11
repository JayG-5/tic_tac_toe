import 'package:get/get.dart';
import 'package:tic_tac_toe/models/game.dart';

class GamePageController extends GetxController{
  GamePageController(this.game);
  final Game game;

  static GamePageController withGetX(){
    final Game game = Get.arguments['game'];
    return GamePageController(game);
  }
}

class GamePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamePageController>(() => GamePageController.withGetX());
  }
}