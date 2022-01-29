import 'package:flutter_ghost_leg/game/ghostLeg/point.dart';

class Line {
  final Point _start;
  final Point _end;

  Line(this._start, this._end);

  Point get start => _start;
  Point get end => _end;
}