import 'package:tic_tac_toe/models/marker.dart';

class Cell {
  Marker? marker;

  Cell({this.marker});

  bool get isEmpty => marker == null;

  void delete() => marker = null;

  void place(Marker marker) => this.marker = marker;

  bool isRight(Marker marker) => this.marker == marker;

  Map<String, dynamic> toJson() {
    return {
      'marker': marker?.toJson(),
    };
  }

  factory Cell.fromJson(Map<String, dynamic> json) {
    return Cell(
      marker: json['marker'] != null ? Marker.fromJson(json['marker']) : null,
    );
  }
}
