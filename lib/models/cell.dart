import 'package:tic_tac_toe/models/marker.dart';

class Cell{
  Marker? marker;
  Cell({this.marker});
  bool get isEmpty => marker == null;
}