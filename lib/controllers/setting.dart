import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/enums/color.dart';
import 'package:tic_tac_toe/enums/game_setting.dart';
import 'package:tic_tac_toe/enums/icon.dart';
import 'package:tic_tac_toe/models/player.dart';

class SettingPageController extends GetxController {
  RxList<int> boardSizes = RxList<int>([]);
  RxInt vCondition = RxInt(GameSetting.VICTORY_CONDITION_DEFAULT.value);
  RxInt backsies = RxInt(GameSetting.BACKSIES_DEFAULT.value);
  RxList<Player> players = RxList<Player>([]);
  Rx<Player?> firstPlayer = Rx<Player?>(null);

  @override
  void onInit() {
    super.onInit();
    players.value = List.generate(2, (index) {
      final icon = PlayerIcon.values[index].iconData;
      final color = PlayerColor.values[index].color;
      return Player(
          marker: Icon(icon, color: color),
          color: color,
          backsies: backsies.value);
    });
  }
}
