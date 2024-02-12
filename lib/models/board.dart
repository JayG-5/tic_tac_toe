import 'dart:math';

import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/marker.dart';
import 'package:tic_tac_toe/utils.dart';

class Board {
  final int size;
  late final List<List<Cell>> cells;

  Board({required this.size}) {
    cells = List.generate(
        size, (y) => List.generate(size, (x) => Cell(x: x, y: y)));
  }

  bool isFull(){
    for(List<Cell> cellY in cells){
      for(Cell cell in cellY){
        if(cell.isEmpty){
          return false;
        }
      }
    }
    return true;
  }

  Board copyWith({int? size}) {
    return Board(
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'cells': cells
          .map((row) => row.map((cell) => cell.toJson()).toList())
          .toList(),
    };
  }

  factory Board.fromJson(Map<String, dynamic> json) {
    final size = json['size'];
    final cellsJson = json['cells'] as List;
    final cells = cellsJson
        .map((row) =>
            (row as List).map((cellJson) => Cell.fromJson(cellJson)).toList())
        .toList();

    return Board(size: size)..cells = cells;
  }

  void delete(int x, int y) => cells[y][x].delete();

  void place(Marker marker) => cells[marker.y][marker.x].place(marker);

  bool checkRow(Marker marker, int vCondition) =>
      check(cells[marker.y], marker, vCondition);

  bool checkCol(Marker marker, int vCondition) =>
      check(cells.map((e) => e[marker.x]).toList(), marker, vCondition);

  bool checkLeftTopToRightBottom(Marker marker, int vCondition) {
    List<Cell> cellList = [];
    int size = cells.length;

    int startX = marker.x - min(marker.x, marker.y);
    int startY = marker.y - min(marker.x, marker.y);

    for (int i = 0; startX + i < size && startY + i < size; i++) {
      cellList.add(cells[startX + i][startY + i]);
    }

    return check(cellList, marker, vCondition);
  }

  bool checkRightTopToLeftBottom(Marker marker, int vCondition) {
    List<Cell> cellList = [];
    int size = cells.length;

    int startX = marker.x + min(marker.y, size - 1 - marker.x);
    int startY = marker.y - min(marker.y, size - 1 - marker.x);

    for (int i = 0; startX - i >= 0 && startY + i < size; i++) {
      cellList.add(cells[startX - i][startY + i]);
    }

    return check(cellList, marker, vCondition);
  }

  bool check(List<Cell> cellList, Marker marker, int vCondition) {
    final int validLength = findMaxConsecutiveChars(
    cellList.map((e) => e.isRight(marker) ? 'o' : 'x').join(), 'o');
    bool isCheck = vCondition <= validLength;
    print(cellList.map((e) => e.isRight(marker) ? 'o' : 'x').join());
    print(validLength);
    return isCheck;

  }

  bool checkWinner(Marker marker, int vCondition) =>
      checkRow(marker, vCondition) ||
      checkCol(marker, vCondition) ||
      checkLeftTopToRightBottom(marker, vCondition) ||
      checkRightTopToLeftBottom(marker, vCondition);
}
