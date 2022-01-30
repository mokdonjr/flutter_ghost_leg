import 'package:flutter/material.dart';

import '../model/line.dart';

class GhostLegSceneEndingPainter extends CustomPainter {
  GhostLegSceneEndingPainter({
    Key? key,
    required this.playerCount,
    required this.width,
    required this.height,
    required this.verticalLines,
    required this.horizontalLines,
  });

  final double width;
  final double height;
  final int playerCount;
  final List<Line> verticalLines;
  final List<Line> horizontalLines;

  /// 화면을 새로 그릴때마다 호출되며
  /// canvas 객체를 써서 화면을 그린다. (canvas 객체는 paint 객체를 받는다.)
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    // vertical
    for (var line in verticalLines) {
      canvas.drawLine(line.start.toOffset(), line.end.toOffset(), paint);
    }

    // horizontal
    for (var line in horizontalLines) {
      canvas.drawLine(line.start.toOffset(), line.end.toOffset(), paint);
    }
  }

  /// 화면을 새로 그릴지 판단 조건
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}