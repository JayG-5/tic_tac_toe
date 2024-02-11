import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/pages/home.dart';

enum Routes {
  home('/', widget: HomePage());

  final String name;
  final Widget widget;
  final Transition transition;
  final Bindings? bindings;

  const Routes(this.name,
      {required this.widget,
      this.transition = Transition.noTransition,
      this.bindings});

  GetPage get pageBuilder => GetPage(
        name: name,
        page: () => widget,
        transition: transition,
        binding: bindings,
      );

  static List<GetPage> get pageBuilders => Routes.values.map((e) => e.pageBuilder).toList();
}
