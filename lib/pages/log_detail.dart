import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/log_detail.dart';

class LogDetailPage extends GetView<LogDetailPageController> {
  const LogDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final boxSize = min(MediaQuery.of(context).size.width - 40,
        MediaQuery.of(context).size.height - 100);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [

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
                  .map((e) => Container(
                    color: Colors.white,
                    child: e.marker != null
                        ? Center(
                      child: Icon(
                        e.marker?.player.iconData,
                        color: e.marker?.player.color,
                      ),
                    )
                        : null,
                  ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
