import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  int _playerCount = 0;

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
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: GamePage(title: widget.title, playerCount: _playerCount),
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              margin: const EdgeInsets.all(_defaultMarginSize),
              child: const Text(
                "참가자 수",
                style: TextStyle(
                  fontSize: 30.0
                ),
              ),
            ),

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
