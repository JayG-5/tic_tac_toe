import 'package:get/get.dart';
import 'package:tic_tac_toe/models/board.dart';
import 'package:tic_tac_toe/models/marker.dart';
import 'package:tic_tac_toe/models/player.dart';

class Game {
  final int vCondition;
  final List<Player> players;
  final Player? firstPlayer;
  final DateTime startTime;
  final Board board;
  Player nowTurn;
  List<Marker>? logs;
  Player? winner;

  Game({
    required this.vCondition,
    required this.players,
    this.firstPlayer,
    required this.startTime, // 생성자를 통해 초기화
    required this.board,
    required this.nowTurn,
    this.logs,
    this.winner,
  }){

    logs ??= [];
  }

  Game copyWith({
    int? vCondition,
    List<Player>? players,
    Player? firstPlayer,
    Board? board,
    Player? nowTurn,
    List<Marker>? logs,
    Player? winner,
  }) {
    return Game(
      vCondition: vCondition ?? this.vCondition,
      players: players ?? this.players,
      firstPlayer: firstPlayer ?? this.firstPlayer,
      startTime: startTime,
      board: board ?? this.board,
      nowTurn: nowTurn ?? this.nowTurn,
      logs: logs ?? this.logs,
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vCondition': vCondition,
      'players': players.map((player) => player.toJson()).toList(),
      'firstPlayer': firstPlayer?.toJson(),
      'startTime': startTime.toIso8601String(),
      'board': board.toJson(),
      'nowTurn': nowTurn.toJson(),
      'logs': logs!.map((log) => log.toJson()).toList(),
      'winner': winner?.toJson(),
    };
  }

  factory Game.fromJson(dynamic json) {
    return Game(
      vCondition: json['vCondition'],
      players: (json['players'] as List).map((e) => Player.fromJson(e)).toList(),
      firstPlayer: json['firstPlayer'] != null ? Player.fromJson(json['firstPlayer']) : null,
      startTime: DateTime.parse(json['startTime']),
      board: Board.fromJson(json['board']),
      nowTurn: Player.fromJson(json['nowTurn']),
      logs: (json['logs'] as List).map((e) => Marker.fromJson(e)).toList(),
      winner: json['winner'] != null ? Player.fromJson(json['winner']) : null
    );
  }

  void backsies() {
    final popMarker = logs!.last.copyWith(status: false);
    final isBacksies = popMarker.player.doBacksies();
    if (!isBacksies) {
      Get.snackbar('무르기 실패','남은 무르가가 없습니다');
      return;
    }
    board.delete(popMarker.x, popMarker.y);
    logs!.add(popMarker);
    nextTurn();
  }

  List<Player> placeMarker(int x, int y) {
    final marker = Marker(player: nowTurn, x: x, y: y);
    board.place(marker);
    logs!.add(marker);
    if(board.checkWinner(marker, vCondition)){
      winner = marker.player;
      return [winner!];
    }
    if(board.isFull()){
      return players;
    }
    nextTurn();
    return [];
  }

  void nextTurn() =>
      nowTurn = players.firstWhere((element) => element != nowTurn);
}
