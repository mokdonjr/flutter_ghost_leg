import 'package:flutter/material.dart';
import 'dart:math';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title, required this.playerCount}) : super(key: key);

  final String title;
  final int playerCount;

  final double _width = 500;
  final double _height = 500;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CustomPaint(
        size: Size(widget._width, widget._height), // 위젯 크기
        painter: MyPainter(playerCount: widget.playerCount, width: widget._width, height: widget._height), // 화면 그릴 painter
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({Key? key, required this.playerCount, required this.width, required this.height});

  final double width;
  final double height;
  final int playerCount;
  final Random random = new Random();

  /// 화면을 새로 그릴때마다 호출되며
  /// canvas 객체를 써서 화면을 그린다. (canvas 객체는 paint 객체를 받는다.)
  @override
  void paint(Canvas canvas, Size size) {

    double barHeight = height * 5 / 4;
    double interval = /*size.width*/width / (playerCount + 1);

    var paint = new Paint()
        ..color = Colors.deepPurpleAccent
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 4.0;

    // vertical
    for (var i = 0; i < playerCount; i++) {
      double pointX = interval * (i + 1);

      // draw!
      Offset startPoint = Offset(pointX, 0.0);
      Offset endPoint = Offset(pointX, barHeight);
      print("vertial x:${startPoint.dx}, y:${startPoint.dy} -> x:${endPoint.dx}, y:${endPoint.dy}");
      canvas.drawLine(startPoint, endPoint, paint);
    }

    // 랜덤 처리
    List<double> pointYList = [];
    int randomCount = random.nextInt(playerCount); // 플레이어 수 보다 많아야 재미요소가 있음!
    int allCount = playerCount + randomCount;
    print("horizontal count : $allCount = $playerCount + $randomCount");
    for (var i = 0; i < allCount; i++) {
      double pointY = barHeight / (allCount + 1) * (i + 1); // y 는 모두 유니크 해야한다! 무승부 없게
      pointYList.add(pointY);
      print("horizontal pointY : $pointY");
    }
    pointYList.shuffle(); // 이 라이브러리 잘 확인해야함..

    // horizontal
    for (var i = 0; i < allCount; i++) {
      double pointX = interval * (i + 1);
      if (i > playerCount) {
        // pointX = interval * (i + 1 - playerCount);
        pointX = interval * (i - playerCount - 1);
      }
      double pointY = pointYList[i];

      // draw!
      Offset startPoint = Offset(pointX, pointY);
      Offset endPoint = Offset(pointX + interval, pointY);
      print("horizontal x:${startPoint.dx}, y:${startPoint.dy} -> x:${endPoint.dx}, y:${endPoint.dy}");
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  /**
   * 화면을 새로 그릴지 판단 조건
   */
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}