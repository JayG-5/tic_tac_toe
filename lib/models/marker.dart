import 'package:tic_tac_toe/models/player.dart';

class Marker {
  final Player player;
  final int x;
  final int y;
  late bool status;
  late final DateTime dateTime;

  Marker(
      {required this.player,
      required this.x,
      required this.y,
      bool? status,
      DateTime? dateTime}) {
    this.status = status ?? true;
    this.dateTime = dateTime ?? DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'player': player.toJson(),
      'x': x,
      'y': y,
      'status': status,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory Marker.fromJson(Map<String, dynamic> json) {
    return Marker(
      player: Player.fromJson(json['player']),
      x: json['x'],
      y: json['y'],
      status: json['status'],
      dateTime: DateTime.parse(json['dateTime']),
    );
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
      ..status = status ?? this.status;
  }
}
