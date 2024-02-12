import 'package:flutter/material.dart';

class Player {
  final IconData iconData;
  final Color color;
  int backsies;

  Player({required this.iconData, required this.color, required this.backsies});

  Player copyWith({
    IconData? iconData,
    Color? color,
    int? backsies,
  }) {
    return Player(
      iconData: iconData ?? this.iconData,
      color: color ?? this.color,
      backsies: backsies ?? this.backsies,
    );
  }

  bool doBacksies(){
    if(backsies > 0){
      backsies -= 1;
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {
      'iconData': iconData.codePoint,
      'color': color.value,
      'backsies': backsies,
    };
  }

  factory Player.fromJson(dynamic json) {
    return Player(
      iconData: IconData(json['iconData'], fontFamily: 'MaterialIcons'),
      color: Color(json['color']),
      backsies: json['backsies'],
    );
  }
}
