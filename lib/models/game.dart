import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/marker.dart';
import 'package:tic_tac_toe/models/player.dart';

class Game {
  final int vCondition;
  final List<Player> players;
  final Player? firstPlayer;
  late final DateTime startTime;
  late final Board board;
  final List<Marker> logs = [];

  Game(int size,
      {required this.vCondition, required this.players, this.firstPlayer}) {
    startTime = DateTime.now();
    board = Board(size: size);
  }
}
