import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:tic_tac_toe/widgets/dialog/draw.dart';
import 'package:tic_tac_toe/widgets/dialog/winner.dart';

class GamePageController extends GetxController{
  GamePageController(Game game){
    this.game.value = game;
  }
  final Rx<Game?> game = Rx<Game?>(null);

  static GamePageController withGetX(){
    final Game game = Get.arguments['game'];
    return GamePageController(game);
  }

  void placeMarker(int x, int y) {
    if(game.value!.board.cells![y][x].marker != null){
      return;
    }
    game.value = game.value?.copyWith();

    switch(game.value!.placeMarker(x, y).length){
      case 1:
        Get.dialog(WinnerDialogView(game: game.value!, player: game.value!.logs!.last.player),barrierDismissible: false);
        return ;
    //TODO: 이김
      case 2:
        Get.dialog(DrawDialogView(game: game.value!),barrierDismissible: false);
        return;
      //TODO: 비김
    }
  }

  void backsies(){
    game.value!.backsies();
    game.value = game.value?.copyWith();
  }
}

class GamePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GamePageController>(() => GamePageController.withGetX());
  }
}