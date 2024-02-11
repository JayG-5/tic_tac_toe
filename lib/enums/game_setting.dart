// ignore_for_file: constant_identifier_names

enum GameSetting {
  BOARD_SIZE_MIN(3),
  BOARD_SIZE_MAX(5),
  BOARD_SIZE_DEFAULT(3),

  VICTORY_CONDITION_MIN(3),
  VICTORY_CONDITION_DEFAULT(3),

  BACKSIES_MIN(0),
  BACKSIES_MAX(5),
  BACKSIES_DEFAULT(2),

  PLAYER_1_ICON_DEFAULT(0),
  PLAYER_1_COLOR_DEFAULT(0),

  PLAYER_2_ICON_DEFAULT(1),
  PLAYER_2_COLOR_DEFAULT(1),
  ;

  final int value;

  const GameSetting(this.value);
}