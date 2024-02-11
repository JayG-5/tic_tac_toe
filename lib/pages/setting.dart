import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(onPressed: (){}, child: Text('취소')),
          ElevatedButton(onPressed: (){}, child: Text('게임 시작')),
        ],
      ),
    );
  }
}
