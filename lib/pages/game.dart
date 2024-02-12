import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game.dart';
import 'package:tic_tac_toe/widgets/common/gap.dart';

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
                Gap.height(16),
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
                Gap.height(16),
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
                    children: controller.game.value!.board.cells!
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
                Gap.height(40),
                if (controller.game.value!.logs!.isNotEmpty &&
                    controller.game.value!.logs!.last.status)
                  ElevatedButton(
                      onPressed: () => controller.backsies(),
                      child: Text(
                        '무르기\n(${controller.game.value!.logs!.last.player.backsies}회 남음)',
                        textAlign: TextAlign.center,
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
