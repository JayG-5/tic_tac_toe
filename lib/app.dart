import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: AppRoutes.routes(),
    );
  }
}
