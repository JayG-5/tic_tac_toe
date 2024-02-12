import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/models/game.dart';

class DrawDialogView extends StatelessWidget {
  const DrawDialogView({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        title: const Text('무승부!'),
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
