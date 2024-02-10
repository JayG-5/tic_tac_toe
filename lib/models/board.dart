import 'package:tic_tac_toe/models/cell.dart';

class Board {
  final int size;
  late final List<List<Cell>> cells;

  Board({required this.size}) {
    cells = List.generate(size, (_) => List.generate(size, (_) => Cell()));
  }
}
