import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';

enum PlayerColor {
  blue(Colors.blue),
  red(Colors.red),
  green(Colors.green),
  orange(Colors.orange),
  black(Colors.black);

  final Color color;

  const PlayerColor(this.color);

  static List<Color> getNonUseColors(List<Player> players, Color nowColor) {
    final playerColors = players.map((e) => e.color.value).toList();
    final nonUseColors = [nowColor] +
        PlayerColor.values
            .where((element) => !playerColors.contains(element.color.value))
            .map((e) => e.color)
            .toList();
    return nonUseColors;
  }
}
