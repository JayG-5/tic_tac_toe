import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => Get.toNamed('/setting'), child: const Text('게임 시작')),
              ElevatedButton(onPressed: (){}, child: const Text('기록된 게임 보기')),
            ],
          ),
        ),
      ),
    );
  }
}
