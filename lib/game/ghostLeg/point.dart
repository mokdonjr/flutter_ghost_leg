import 'dart:ui';

class Point {
  final double _x;
  final double _y;

  Point(this._x, this._y);

  double get x => _x;
  double get y => _y;

  Offset toOffset() {
    return Offset(_x, _y);
  }
}