import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';

enum PlayerIcon {
  cross(Icons.clear),
  circle(Icons.circle_outlined),
  triangle(Icons.change_history),
  square(Icons.square_outlined),
  heart(Icons.favorite_border);

  final IconData iconData;

  const PlayerIcon(this.iconData);

  List<IconData> getNonUseIcons(List<Player> players) {
    final playerIcons = players.map((e) => e.marker.icon?.codePoint).toList();
    final nonUseIcons = PlayerIcon.values
        .where((element) => !playerIcons.contains(element.iconData.codePoint))
        .map((e) => e.iconData)
        .toList();
    return nonUseIcons;
  }
}
