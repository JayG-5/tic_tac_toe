import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/setting.dart';
import 'package:tic_tac_toe/enums/color.dart';
import 'package:tic_tac_toe/enums/icon.dart';

class SettingPagePlayerMarker extends GetView<SettingPageController> {
  const SettingPagePlayerMarker({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 72) / 2;
    return Obx(
      () => Card(
        child: Stack(
          children: [
            Container(
              width: width > 240 ? 240 : width,
              height: 180,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Icon(controller.players[index].iconData,
                          color: controller.players[index].color),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                          underline: Container(),
                          value: controller.players[index].iconData,
                          items: PlayerIcon.getNonUseIcons(controller.players,
                                  controller.players[index].iconData)
                              .map((e) => DropdownMenuItem(
                                    onTap: () => controller.updatePlayer(
                                        controller.players[index],
                                        iconData: e),
                                    value: e,
                                    child: Icon(e),
                                  ))
                              .toList(),
                          onChanged: (value) {}),
                      DropdownButton(
                          underline: Container(),
                          value: controller.players[index].color,
                          items: PlayerColor.getNonUseColors(controller.players,
                                  controller.players[index].color)
                              .map((e) => DropdownMenuItem(
                                    onTap: () => controller.updatePlayer(
                                        controller.players[index],
                                        color: e),
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
              ),
            ),
            Text('${index + 1}P')
          ],
        ),
      ),
    );
  }
}
