import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game/ghost_leg/ui/ghost_leg_scene_ending_painter.dart';
import 'package:flutter_ghost_leg/game/ghost_leg/model/line.dart';
import 'package:flutter_ghost_leg/game/ghost_leg/model/point.dart';

class GhostLegSceneEndingWidget extends StatefulWidget {
  const GhostLegSceneEndingWidget(
      {
        Key? key,
        required this.title,
        required this.playerCount,
        required this.random,
        required this.backgroundColor,
      }
    ) : super(key: key);

  final String title;
  final int playerCount;
  final Random random;
  final Color backgroundColor;

  final double _width = 500;
  final double _height = 500;

  double getHorizontalLineLength() {
    return _width / (playerCount + 1);
  }
  double getVerticalLineLength() {
    return _height * 4 / 5;
  }

  List<Line> _getVerticalLines() {
    double verticalLineLength = getVerticalLineLength();
    double horizontalLineLength = getHorizontalLineLength();

    List<Line> lines = [];
    for (var i = 0; i < playerCount; i++) {
      double x = horizontalLineLength * (i + 1);
      var line = Line(Point(x, 0.0), Point(x, verticalLineLength));
      lines.add(line);
      print("vertical (${line.start.x}, ${line.start.y}) -> (${line.end.x}, ${line.end.y})");
    }
    return lines;
  }

  List<Line> _getHorizontalLines() {
    double verticalLineLength = getVerticalLineLength();
    double horizontalLineLength = getHorizontalLineLength();

    List<Line> lines = [];

    // 랜덤 처리
    List<double> pointYList = [];
    int randomCount = random.nextInt(playerCount); // 플레이어 수 보다 많아야 재미요소가 있음!
    int allCount = playerCount + randomCount;
    print("horizontal count : $allCount = $playerCount + $randomCount");
    for (var i = 0; i < allCount; i++) {
      double y = verticalLineLength / (allCount + 1) * (i + 1); // y 는 모두 유니크 해야한다! 무승부 없게
      pointYList.add(y);
    }
    pointYList.shuffle(); // 이 라이브러리 잘 확인해야함..

    // horizontal
    for (var i = 0; i < allCount; i++) {
      double x = horizontalLineLength * (i + 1);
      if (i >= playerCount - 1) {
        x = horizontalLineLength * (playerCount - 1);
      }
      double y = pointYList[i];

      var line = Line(Point(x, y), Point(x + horizontalLineLength, y));
      lines.add(line);
      print("horizontal (${line.start.x}, ${line.start.y}) -> (${line.end.x}, ${line.end.y})");
    }
    return lines;
  }

  @override
  _GhostLegSceneEndingWidgetState createState() => _GhostLegSceneEndingWidgetState();
}

class _GhostLegSceneEndingWidgetState extends State<GhostLegSceneEndingWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: widget.backgroundColor,
      child: CustomPaint(
        // 위젯 크기
        size: Size(
            widget._width,
            widget._height
        ),
        // 화면 그릴 painter
        painter: GhostLegSceneEndingPainter(
            playerCount: widget.playerCount,
            width: widget._width,
            height: widget._height,
            verticalLines: widget._getVerticalLines(),
            horizontalLines : widget._getHorizontalLines(),
        ),
      ),
    );
  }
}