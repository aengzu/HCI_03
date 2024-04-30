import 'package:flutter/material.dart';
import 'package:hci_03/screens/main_screens.dart';

import 'constants/theme.dart';

void main() {
  runApp(const MiracleApp());

}


class MiracleApp extends StatelessWidget {
  const MiracleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HCI03_UI',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MainScreens(),
    );
  }
}
