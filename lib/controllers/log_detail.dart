import 'package:get/get.dart';
import 'package:tic_tac_toe/models/cell.dart';
import 'package:tic_tac_toe/models/game.dart';

class LogDetailPageController extends GetxController {
  LogDetailPageController(Game game) {
    this.game.value = game;
  }

  final Rx<Game?> game = Rx<Game?>(null);
  final Rx<List<Cell>?> selectList = Rx<List<Cell>?>(null);

  static LogDetailPageController withGetX() {
    final Game game = Get.arguments['game'];
    return LogDetailPageController(game);
  }

  void onPressListTile(int index) {
    final board = List.generate(game.value!.board.size,
        (y) => List.generate(game.value!.board.size, (x) => Cell(x: x, y: y)));
    game.value!.logs!
        .sublist(0, index + 1)
        .forEach((element) => board[element.y][element.x].marker = element);
    selectList.value = board.expand((e) => e).toList();
  }
}

class LogDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogDetailPageController>(
        () => LogDetailPageController.withGetX());
  }
}
