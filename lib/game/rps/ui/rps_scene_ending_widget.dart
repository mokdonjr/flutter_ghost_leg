import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game/rps/model/hand.dart';
import 'package:lottie/lottie.dart';

class RpsSceneEndingWidget extends StatefulWidget {
  const RpsSceneEndingWidget({Key? key, required this.title, required this.p1HandType, required this.p2HandType}) : super(key: key);

  final String title;
  final HandType p1HandType;
  final HandType p2HandType;

  @override
  _RpsSceneEndingWidgetState createState() => _RpsSceneEndingWidgetState();
}

class _RpsSceneEndingWidgetState extends State<RpsSceneEndingWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
              width: 150,
              height: 130,
              fit: BoxFit.cover,
              animate: true,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // p1
              Image(
                  image: AssetImage(widget.p1HandType.getAssetName()),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center
              ),

              // p2
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi), // 좌우반전
                child: Image(
                    image: AssetImage(widget.p2HandType.getAssetName()),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}