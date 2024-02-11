import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/setting.dart';
import 'package:tic_tac_toe/enums/color.dart';
import 'package:tic_tac_toe/enums/icon.dart';

class SettingPage extends GetView<SettingPageController> {
  const SettingPage({super.key});

  Widget playerMarker(int index) {
    return Column(
      children: [
        Icon(controller.players[index].iconData,
            color: controller.players[index].color),
        Row(
          children: [
            DropdownButton(
                value: controller.players[index].iconData,
                items: PlayerIcon.getNonUseIcons(controller.players,controller.players[index].iconData)
                    .map((e) => DropdownMenuItem(
                          onTap: () => controller.updatePlayer(controller.players[index],iconData: e),
                          value: e,
                          child: Icon(e),
                        ))
                    .toList(),
                onChanged: (value) {}),
            DropdownButton(
                value: controller.players[index].color,
                items: PlayerColor.getNonUseColors(controller.players,controller.players[index].color)
                    .map((e) => DropdownMenuItem(
                  onTap: () => controller.updatePlayer(controller.players[index],color: e),
                          value: e,
                          child: Icon(
                            Icons.square,
                            color: e,
                          ),
                        ))
                    .toList(),
                onChanged: (value) {}),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      children: controller.boardSizes.value
                          .map((element) => ActionChip(
                                label: Text(
                                  '$element x $element',
                                ),
                                backgroundColor:
                                    element == controller.boardSize.value
                                        ? Colors.blue
                                        : Colors.white,
                                onPressed: () =>
                                    controller.onPressBoardSize(element),
                              ))
                          .toList(),
                    ),
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressVCondition(false),
                        icon: Icon(Icons.remove)),
                    Text(controller.vCondition.value.toString()),
                    IconButton(
                        onPressed: () => controller.onPressVCondition(true),
                        icon: Icon(Icons.add)),
                  ]),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressBacksies(false),
                        icon: Icon(Icons.remove)),
                    Text(controller.backsies.value.toString()),
                    IconButton(
                        onPressed: () => controller.onPressBacksies(true),
                        icon: Icon(Icons.add)),
                  ]),
                  Row(
                    children: [
                      playerMarker(0),
                      playerMarker(1),
                    ],
                  ),
                  Row(children: [
                    IconButton(
                        onPressed: () => controller.onPressFirstPlayer(false),
                        icon: Icon(Icons.arrow_back_ios)),
                    Icon(
                      controller.firstPlayer.value?.iconData ??
                          Icons.question_mark,
                      color:
                          controller.firstPlayer.value?.color ?? Colors.black,
                    ),
                    IconButton(
                        onPressed: () => controller.onPressFirstPlayer(true),
                        icon: Icon(Icons.arrow_forward_ios)),
                  ]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('취소')),
              ElevatedButton(onPressed: () {}, child: Text('게임 시작')),
            ],
          ),
        ),
      ),
    );
  }
}
