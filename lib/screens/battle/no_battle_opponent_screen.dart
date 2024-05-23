import 'package:flutter/material.dart';

import '../../constants/theme.dart';

class NoBattleOpponentScreen extends StatelessWidget {
  final String message;

  const NoBattleOpponentScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message,
          style: textTheme().titleLarge,
        ),
      ),
    );
  }
}
