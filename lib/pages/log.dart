import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac_toe/models/game.dart';

class LogPage extends StatelessWidget {
  const LogPage({super.key});

  Widget boardSize(Game game) {
    return Text('보드 사이즈: ${game.board.size} x ${game.board.size}');
  }

  Widget vCondition(Game game) {
    return Text('승리 조건: ${game.vCondition}');
  }

  Widget gameResult(Game game) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      const Text('게임 결과: '),
      game.winner == null
          ? const Text('무승부')
          : Icon(
              game.winner!.iconData,
              color: game.winner!.color,
            ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('games');
    return ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, box, widget) {
          return Scaffold(
            appBar: AppBar(),
            body: box.values.isEmpty
                ? const Center(child: Text('기록된 게임이 없습니다.'))
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final Game game = Game.fromJson(box.getAt(index));
                      return ListTile(
                        title: Text(
                            "${DateFormat('yyyy-MM-dd hh:mm:ss').format(game.startTime)} 게임"),
                        subtitle: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            boardSize(game),
                            vCondition(game),
                            gameResult(game),
                          ],
                        ),
                        // trailing: IconButton(
                        //     icon: Icon(Icons.delete), onPressed: () {}),
                        onTap: () =>
                            Get.toNamed('/detail', arguments: {'game': game}),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: box.values.length),
          );
        });
  }
}
