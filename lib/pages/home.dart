import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/widgets/common/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img.png'),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => Get.toNamed('/setting'),
                    child: const Text('게임 시작')),
                Gap.height(20),
                ElevatedButton(
                    onPressed: () => Get.toNamed('/log'),
                    child: const Text('기록된 게임 보기')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
