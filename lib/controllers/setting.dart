import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/enums/color.dart';
import 'package:tic_tac_toe/enums/game_setting.dart';
import 'package:tic_tac_toe/enums/icon.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:tic_tac_toe/models/player.dart';

class SettingPageController extends GetxController {
  late RxList<int> boardSizes;
  late RxList<Player> players;

  RxInt boardSize = RxInt(GameSetting.BOARD_SIZE_DEFAULT.value);
  RxInt vCondition = RxInt(GameSetting.VICTORY_CONDITION_DEFAULT.value);
  RxInt backsies = RxInt(GameSetting.BACKSIES_DEFAULT.value);
  Rx<Player?> firstPlayer = Rx<Player?>(null);

  @override
  void onInit() {
    super.onInit();
    boardSizes = RxList<int>(List.generate(
        GameSetting.BOARD_SIZE_MAX.value - GameSetting.BOARD_SIZE_MIN.value + 1,
        (index) => GameSetting.BOARD_SIZE_MIN.value + index));

    players = RxList<Player>(List.generate(2, (index) {
      final iconData = PlayerIcon.values[index].iconData;
      final color = PlayerColor.values[index].color;
      return Player(iconData: iconData, color: color, backsies: backsies.value);
    }));
  }

  void onPressBoardSize(int size) {
    if (vCondition.value > size) {
      vCondition.value = size;
      //TODO: 스낵바
    }
    boardSize.value = size;
  }

  void onPressVCondition(bool isPlus) {
    final result = isPlus ? vCondition.value += 1 : vCondition.value -= 1;
    if (!(result >= GameSetting.VICTORY_CONDITION_MIN.value &&
        result <= boardSize.value)) {
      //TODO: 예외처리
      return;
    }
    vCondition.value = result;
  }

  void onPressBacksies(bool isPlus) {
    final result = isPlus ? backsies.value += 1 : backsies.value -= 1;
    if (!(result >= GameSetting.BACKSIES_MIN.value &&
        result <= GameSetting.BACKSIES_MAX.value)) {
      //TODO: 예외처리
      return;
    }
    backsies.value = result;
  }

  void onPressFirstPlayer(bool isRight) {
    final List<Player?> firstPlayerSelectList = [null, ...players.value];
    final nowIndex = firstPlayerSelectList.indexOf(firstPlayer.value);
    try {
      firstPlayer.value =
          firstPlayerSelectList[isRight ? nowIndex + 1 : nowIndex - 1];
    } catch (e) {
      firstPlayer.value =
          isRight ? firstPlayerSelectList.first : firstPlayerSelectList.last;
    }
  }

  void updatePlayer(Player player, {IconData? iconData, Color? color}) {
    final Player updatedPlayer =
        player.copyWith(iconData: iconData, color: color);
    players.value =
        players.value.map((e) => e == player ? updatedPlayer : e).toList();
  }

  Game getGame() => Game(boardSize.value,
      vCondition: vCondition.value,
      firstPlayer: firstPlayer.value,
      players: players.value.map((e) {
        e.backsies = backsies.value;
        return e;
      }).toList());
}

class SettingPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageController());
  }
}
