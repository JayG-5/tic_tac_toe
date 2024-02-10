import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/marker.dart';
import 'package:tic_tac_toe/models/player.dart';

class Game {
  final int vCondition;
  final List<Player> players;
  final Player? firstPlayer;

  late final DateTime startTime;
  late final Board board;
  late Player nowTurn;

  final List<Marker> logs = [];

  Game(int size,
      {required this.vCondition, required this.players, this.firstPlayer}) {
    startTime = DateTime.now();
    board = Board(size: size);
    nowTurn =
        firstPlayer ?? (startTime.second.isOdd ? players.first : players.last);
  }

  void backsies() {
    final popMarker = logs.last.copyWith(status: false);
    board.delete(popMarker.x, popMarker.y);
    logs.add(popMarker);
  }

  void placeMarker(int x, int y) {
    final marker = Marker(player: nowTurn, x: x, y: y);
    board.place(marker);
    nextTurn();
    board.checkWinner(marker, vCondition);
  }

  void nextTurn() =>
      nowTurn = players.firstWhere((element) => element != nowTurn);

}
