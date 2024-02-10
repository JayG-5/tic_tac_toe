import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';

class Marker {
  final Player player;
  late bool status;
  late final DateTime dateTime;

  Marker({required this.player}) {
    status = true;
    dateTime = DateTime.now();
  }
}
