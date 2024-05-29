import 'package:flutter/material.dart';

class BattleMessageScreen extends StatelessWidget {
  final String message;

  const BattleMessageScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('배틀 상태'),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
