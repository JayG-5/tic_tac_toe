import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tic_tac_toe/controllers/log_detail.dart';
import 'package:tic_tac_toe/models/marker.dart';

class LogDetailPage extends GetView<LogDetailPageController> {
  const LogDetailPage({super.key});

  int getIndex(List<Marker> log, Marker marker) {
    return log.indexWhere((element) => element.dateTime == marker.dateTime) + 1;
  }

  @override
  Widget build(BuildContext context) {
    final boxSize = min(MediaQuery.of(context).size.width - 40,
        MediaQuery.of(context).size.height - 100);
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
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
                  children: (controller.selectList.value ?? controller.game.value!.board.cells!.expand((e) => e))
                      .map((e) => Container(
                            color: Colors.white,
                            child: e.marker != null
                                ? Stack(
                                    children: [
                                      e.marker!.status?Center(
                                        child: Icon(
                                          e.marker!.player.iconData,
                                          color: e.marker!.player.color,
                                        ),
                                      ):Container(),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            color: Colors.black,
                                            alignment: Alignment.center,
                                            child: Text(
                                                '${getIndex(controller.game.value!.logs!, e.marker!)}',
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ))
                                    ],
                                  )
                                : null,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        final log = controller.game.value!.logs![index];
                        return ListTile(
                          leading: Icon(log.player.iconData,
                              color: log.player.color),
                          title: Text(log.status ? '착수' : '무르기'),
                          subtitle: Text(
                            DateFormat('yyyy-MM-dd hh:mm:ss')
                                .format(log.dateTime),
                          ),
                          onTap: () => controller.onPressListTile(index),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.game.value!.logs!.length))
            ],
          ),
        ),
      ),
    );
  }
}
