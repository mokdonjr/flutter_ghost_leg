import 'package:flutter/material.dart';
import 'package:flutter_ghost_leg/game/ghostLeg/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghost Leg',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SettingPage(title: 'Flutter Demo Home Page'),
      home: const Center(child: SettingPage(title: '사다리타기')),
    );
  }
}