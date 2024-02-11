import 'package:flutter/material.dart';

class Player {
  final Icon marker;
  final Color color;
  int backsies;

  Player({required this.marker, required this.color, required this.backsies});

  bool doBacksies(){
    if(backsies > 0){
      backsies -= 1;
      return true;
    }
    return false;
  }

  Map<String, dynamic> toJson() {
    return {
      'marker': marker.icon?.codePoint ?? 0,
      'color': color.value,
      'backsies': backsies,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      marker: Icon(IconData(json['marker'], fontFamily: 'MaterialIcons')),
      color: Color(json['color']),
      backsies: json['backsies'],
    );
  }
}
