import 'package:flutter/material.dart';
import 'package:hci_03/opponent_provider.dart';
import 'package:provider/provider.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/task_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OpponentProvider()),
        ChangeNotifierProvider(create: (_) => TaskController()),
      ],
      child: MiracleApp(),
    ),
  );
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
