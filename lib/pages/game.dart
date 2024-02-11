import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game.dart';

class GamePage extends GetView<GamePageController> {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final boxSize = min(MediaQuery.of(context).size.width - 40,
        MediaQuery.of(context).size.height - 100);
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      controller.game.value!.players.first.iconData,
                      color: controller.game.value!.players.first.color,
                    ),
                    const Text('VS'),
                    Icon(
                      controller.game.value!.players.last.iconData,
                      color: controller.game.value!.players.last.color,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                      controller.game.value!.nowTurn.iconData,
                      color: controller.game.value!.nowTurn.color,
                    )),
                    const TextSpan(
                      text: '님 차례입니다.',
                    ),
                  ], style: const TextStyle(color: Colors.black)),
                ),
                ElevatedButton(onPressed: () {}, child: const Text('무르기')),
                Container(
                  color: Colors.grey,
                  width: boxSize,
                  height: boxSize,
                  child: GridView.count(
                    physics: const ClampingScrollPhysics(),
                    crossAxisCount: controller.game.value!.board.size,
                    childAspectRatio: 1 / 1,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: controller.game.value!.board.cells
                        .expand((e) => e)
                        .map((e) => InkWell(
                              onTap: () => controller.placeMarker(e.x, e.y),
                              child: Container(
                                color: Colors.white,
                                child: e.marker != null
                                    ? Center(
                                        child: Icon(
                                          e.marker?.player.iconData,
                                          color: e.marker?.player.color,
                                        ),
                                      )
                                    : null,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
