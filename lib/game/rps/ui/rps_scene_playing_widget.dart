import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game/rps/model/hand.dart';
import 'package:flutter_ghost_leg/game/rps/ui/rps_scene_ending_widget.dart';

class RpsScenePlayingWidget extends StatefulWidget {
  const RpsScenePlayingWidget({Key? key, required this.title, required this.backgroundColor}) : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  _RpsScenePlayingWidgetState createState() => _RpsScenePlayingWidgetState();
}

class _RpsScenePlayingWidgetState extends State<RpsScenePlayingWidget> {

  HandType _handType = HandType.none;
  Random random = Random();
  String statement = "Choose!";
  
  HandType _getRandomHandType() {
    int validHandTypeLen = HandType.values.length - 1; // none 타입을 제외한 나머지 타입들
    int randomOrdinal = random.nextInt(validHandTypeLen);
    return HandType.values[randomOrdinal + 1]; // none 타입을 제외한 나머지중 랜덤
  }

  void _chooseHand(HandType handType) {
    setState(() {
      _handType = handType;
      statement = "Chosen! ${handType.getDisplayName()}";
    });
  }

  void _startGame() {
    if (_handType == HandType.none) {
      return;
    }

    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (context) {
              return Scaffold(
                // appBar: AppBar(
                //   title: Text(widget.title),
                // ),
                body: RpsSceneEndingWidget(
                  title: widget.title,
                  p1HandType: _handType,
                  p2HandType: _getRandomHandType(),
                  backgroundColor: widget.backgroundColor,
                ),
              );
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    const double _defaultMarginSize = 15.0;
    const TextStyle _defaultElevatedButtonTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    const double _defaultIconSize = 30.0;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      backgroundColor: widget.backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // 플레이어 선택 결과
            _handType == HandType.none ? const Text("?", style: TextStyle(fontSize: 200.0, color: CupertinoColors.darkBackgroundGray, fontWeight: FontWeight.bold)) :
            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              width: 200,
              height: 200,
              // 동그라미 이미지
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image(
                  image: AssetImage(_handType.getAssetName()),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center
              ),
            ),

            // 플레이어 입력 설명
            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              child: Text(
                statement,
                style: const TextStyle(
                    fontSize: 30.0
                ),
              ),
            ),

            // 플레이어 입력
            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // 바위
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(_defaultMarginSize),
                          // 동그라미 이미지
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              HandType.rock.getAssetName(),
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            iconSize: _defaultIconSize,
                            onPressed: () => _chooseHand(HandType.rock),
                          ),
                        ),
                        Text(
                          HandType.rock.getDisplayName(),
                          style: _defaultElevatedButtonTextStyle,
                        ),
                      ],
                    ),
                  ),

                  // 보
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(_defaultMarginSize),
                          // 동그라미 이미지
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              HandType.paper.getAssetName(),
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            iconSize: _defaultIconSize,
                            onPressed: () => _chooseHand(HandType.paper),
                          ),
                        ),
                        Text(
                          HandType.paper.getDisplayName(),
                          style: _defaultElevatedButtonTextStyle,
                        ),
                      ],
                    ),
                  ),

                  // 가위
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(_defaultMarginSize),
                          // 동그라미 이미지
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              HandType.scissors.getAssetName(),
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                            ),
                            iconSize: _defaultIconSize,
                            onPressed: () => _chooseHand(HandType.scissors),
                          ),
                        ),
                        Text(
                          HandType.scissors.getDisplayName(),
                          style: _defaultElevatedButtonTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 플레이어 결정
            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              child: ElevatedButton(
                  onPressed: _startGame,
                  child: const Text(
                      "START GAME",
                      style: _defaultElevatedButtonTextStyle
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
