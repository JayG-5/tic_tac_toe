import 'package:tic_tac_toe/models/player.dart';

class Marker {
  final Player player;
  final int x;
  final int y;
  late bool status;
  late final DateTime dateTime;

  Marker({required this.player, required this.x, required this.y}) {
    status = true;
    dateTime = DateTime.now();
  }

  Marker copyWith({
    Player? player,
    int? x,
    int? y,
    bool? status,
  }) {
    return Marker(
      player: player ?? this.player,
      x: x ?? this.x,
      y: y ?? this.y,
    )
      ..status = status ?? this.status
      ..dateTime = DateTime.now();
  }
}
