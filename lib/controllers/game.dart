import 'package:get/get.dart';
import 'package:tic_tac_toe/models/game.dart';

class GamePageController extends GetxController{
  GamePageController(Game game){
    this.game.value = game;
  }
  final Rx<Game?> game = Rx<Game?>(null);

  static GamePageController withGetX(){
    final Game game = Get.arguments['game'];
    return GamePageController(game);
  }

  void placeMarker(int x, int y){
    game.value!.placeMarker(x, y);
    game.value = game.value?.copyWith();
  }
}

class GamePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamePageController>(() => GamePageController.withGetX());
  }
}