import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/setting.dart';
import 'package:tic_tac_toe/models/game.dart';
import 'package:tic_tac_toe/widgets/common/gap.dart';
import 'package:tic_tac_toe/widgets/setting/player_marker.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonWidth = (MediaQuery.of(context).size.width - 56) / 2;
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('보드 사이즈',
                      style: Theme.of(context).textTheme.titleMedium),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      children: controller.boardSizes.value
                          .map((element) => ActionChip(
                                label: Text(
                                  '$element x $element',
                                  style: TextStyle(
                                    color: element != controller.boardSize.value
                                        ? Colors.deepPurple
                                        : Colors.white,
                                  ),
                                ),
                                backgroundColor:
                                    element == controller.boardSize.value
                                        ? Colors.deepPurple
                                        : Colors.white,
                                onPressed: () =>
                                    controller.onPressBoardSize(element),
                              ))
                          .toList(),
                    ),
                  ),
                  Gap.height(16),
                  Text('승리 조건', style: Theme.of(context).textTheme.titleMedium),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressVCondition(false),
                        icon: const Icon(Icons.remove)),
                    Text(controller.vCondition.value.toString()),
                    IconButton(
                        onPressed: () => controller.onPressVCondition(true),
                        icon: const Icon(Icons.add)),
                  ]),
                  Gap.height(16),
                  Text('물리기 허용 회수',
                      style: Theme.of(context).textTheme.titleMedium),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressBacksies(false),
                        icon: const Icon(Icons.remove)),
                    Text(controller.backsies.value.toString()),
                    IconButton(
                        onPressed: () => controller.onPressBacksies(true),
                        icon: const Icon(Icons.add)),
                  ]),
                  Gap.height(16),
                  Text('플레이어 마커',
                      style: Theme.of(context).textTheme.titleMedium),
                  Row(
                    children: [
                      const SettingPagePlayerMarker(index: 0),
                      Gap.width(16),
                      const SettingPagePlayerMarker(index: 1),
                    ],
                  ),
                  Gap.height(16),
                  Text('선제 착수', style: Theme.of(context).textTheme.titleMedium),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressFirstPlayer(false),
                        icon: const Icon(Icons.arrow_back_ios)),
                    Icon(
                      controller.firstPlayer.value == null
                          ? Icons.question_mark
                          : controller
                              .players[controller.firstPlayer.value!].iconData,
                      color: controller.firstPlayer.value == null
                          ? Colors.black
                          : controller
                              .players[controller.firstPlayer.value!].color,
                    ),
                    IconButton(
                        onPressed: () => controller.onPressFirstPlayer(true),
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(buttonWidth)),
                  child: const Text('취소')),
              ElevatedButton(
                  onPressed: () {
                    final Game game = controller.getGame();
                    Get.offNamed('/game', arguments: {'game': game});
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(buttonWidth)),
                  child: const Text('게임 시작')),
            ],
          ),
        ),
      ),
    );
  }
}
