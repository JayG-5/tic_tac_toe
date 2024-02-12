import 'package:get/get.dart';
import 'package:tic_tac_toe/models/game.dart';

class LogDetailPageController extends GetxController{

  LogDetailPageController(Game game){
    this.game.value = game;
  }
  final Rx<Game?> game = Rx<Game?>(null);

  static LogDetailPageController withGetX(){
    final Game game = Get.arguments['game'];
    return LogDetailPageController(game);
  }

}

class LogDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogDetailPageController>(() => LogDetailPageController.withGetX());
  }
}