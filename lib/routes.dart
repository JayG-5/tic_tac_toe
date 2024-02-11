import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game.dart';
import 'package:tic_tac_toe/controllers/setting.dart';

import 'pages/game.dart';
import 'pages/home.dart';
import 'pages/log.dart';
import 'pages/setting.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        AppRoute('/', () => const HomePage()),
        AppRoute(
          '/setting',
          () => const SettingPage(),
          bindings: SettingPageBindings(),
        ),
        AppRoute('/game', () => const GamePage(), bindings: GamePageBinding()),
        AppRoute('/log', () => const LogPage()),
      ]
          .map(
            (route) => GetPage(
              name: route.name,
              page: route.widget,
              binding: route.bindings,
              transition: route.transition,
            ),
          )
          .toList();
}

class AppRoute {
  final String name;
  final Widget Function() widget;
  final Transition transition;
  final Bindings? bindings;

  const AppRoute(
    this.name,
    this.widget, {
    this.transition = Transition.noTransition,
    this.bindings,
  });
}
