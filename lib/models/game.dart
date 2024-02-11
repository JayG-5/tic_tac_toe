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

  Map<String, dynamic> toJson() {
    return {
      'vCondition': vCondition,
      'players': players.map((player) => player.toJson()).toList(),
      'firstPlayer': firstPlayer?.toJson(),
      'startTime': startTime.toIso8601String(),
      'board': board.toJson(),
      'nowTurn': nowTurn.toJson(),
      'logs': logs.map((log) => log.toJson()).toList(),
    };
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    final game = Game(
      json['board'].length,
      vCondition: json['vCondition'],
      players: json['players']
          .map((playerJson) => Player.fromJson(playerJson))
          .toList(),
      firstPlayer: json['firstPlayer'] != null
          ? Player.fromJson(json['firstPlayer'])
          : null,
    );
    game.startTime = DateTime.parse(json['startTime']);
    game.board = Board.fromJson(json['board']);
    game.nowTurn = Player.fromJson(json['nowTurn']);
    game.logs.addAll(json['logs'].map((logJson) => Marker.fromJson(logJson)));

    return game;
  }

  void backsies() {
    final popMarker = logs.last.copyWith(status: false);
    final isBacksies = popMarker.player.doBacksies();
    if(!isBacksies){
      //TODO: 무르기 실패 랜더링 다이얼로그나 스낵바
      return;
    }
    board.delete(popMarker.x, popMarker.y);
    logs.add(popMarker);
    nextTurn();
  }

  void placeMarker(int x, int y) {
    final marker = Marker(player: nowTurn, x: x, y: y);
    board.place(marker);
    logs.add(marker);
    board.checkWinner(marker, vCondition);
    nextTurn();
  }

  void nextTurn() =>
      nowTurn = players.firstWhere((element) => element != nowTurn);
}
