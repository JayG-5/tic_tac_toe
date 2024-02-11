import 'package:tic_tac_toe/models/marker.dart';

class Cell {
  Marker? marker;
  final int x;
  final int y;

  Cell({this.marker, required this.x, required this.y});

  Cell copyWith({Marker? marker, int? x, int? y}) {
    return Cell(
      marker: marker ?? this.marker,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  bool get isEmpty => marker == null;

  void delete() => marker = null;

  void place(Marker marker) => this.marker = marker;

  bool isRight(Marker marker) => marker.player.color.value == this.marker?.player.color.value;

  Map<String, dynamic> toJson() {
    return {
      'marker': marker?.toJson(),
      'x': x,
      'y': y,
    };
  }

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      marker: json['marker'] != null ? Marker.fromJson(json['marker']) : null,
      x: json['x'],
      y: json['y'],
    );
  }
}