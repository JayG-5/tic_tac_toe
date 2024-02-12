import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:tic_tac_toe/models/player.dart';

class WinnerDialogView extends StatelessWidget {
  const WinnerDialogView({super.key, required this.game, required this.player});

  final Game game;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: const Text('승리!'),
        content: Row(
          children: [
            const Text('승자: '),
            Icon(
              player.iconData,
              color: player.color,
            )
          ],
        ),
        actions: [
          ElevatedButton(onPressed: ()async{
            final box = Hive.box('games');
            await box.put(game.startTime.toIso8601String(), game.toJson());
            Get.offAllNamed('/');
          }, child: const Text('기록하고 홈으로')),
          ElevatedButton(onPressed: ()=>Get.offAllNamed('/'), child: const Text('홈으로')),
        ],
      ),
    );
  }
}
