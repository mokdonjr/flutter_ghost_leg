import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game/ghost_leg/ui/ghost_leg_scene_ending_widget.dart';

class GhostLegScenePlayingWidget extends StatefulWidget {
  const GhostLegScenePlayingWidget({Key? key, required this.title, required this.backgroundColor}) : super(key: key);

  final String title;
  final Color backgroundColor;

  @override
  _GhostLegScenePlayingWidgetState createState() => _GhostLegScenePlayingWidgetState();
}

class _GhostLegScenePlayingWidgetState extends State<GhostLegScenePlayingWidget> {

  int _playerCount = 0;
  Random random = Random();

  void _increasePlayerCount() {
    setState(() {
      _playerCount++;
    });
  }

  void _decreasePlayerCount() {
    setState(() {
      _playerCount--;
    });
  }

  void _startGame() {
    if (_playerCount >= 2) {
      Navigator.of(context).push(
          MaterialPageRoute<void>(
              builder: (context) {
                return Scaffold(
                  // appBar: AppBar(
                  //   title: Text(widget.title),
                  // ),
                  backgroundColor: widget.backgroundColor,
                  body: GhostLegSceneEndingWidget(
                    title: widget.title,
                    playerCount: _playerCount,
                    random: random,
                    backgroundColor: widget.backgroundColor,
                  ),
                );
              }
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double _defaultMarginSize = 15.0;
    const TextStyle _defaultElevatedButtonTextStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // 플레이어 입력 설명
            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              child: const Text(
                "participants",
                style: TextStyle(
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
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: ElevatedButton(
                      onPressed: _decreasePlayerCount,
                      child: const Text(
                        "-",
                        style: _defaultElevatedButtonTextStyle
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: Text(
                      _playerCount.toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(_defaultMarginSize),
                    child: ElevatedButton(
                      onPressed: _increasePlayerCount,
                      child: const Text(
                        "+",
                        style: _defaultElevatedButtonTextStyle
                      )
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
