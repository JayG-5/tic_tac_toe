import 'package:flutter/material.dart';

enum PlayerIcon {
  cross(Icons.clear),
  circle(Icons.circle_outlined),
  triangle(Icons.change_history),
  square(Icons.square_outlined),
  heart(Icons.favorite_border);

  final IconData iconData;

  const PlayerIcon(this.iconData);
}
