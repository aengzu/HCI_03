import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:hci_03/screens/splash/splash_screen.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:sizing/sizing.dart';
import 'package:hci_03/controllers/user_controller.dart';

void main() {
  runApp(
  MiracleApp(),
  );
}

class MiracleApp extends StatelessWidget {
  const MiracleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizingBuilder(
      builder: () => GetMaterialApp(
        title: 'HCI03_UI',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: LoginScreen(),
        initialBinding: BindingsBuilder(() {
          Get.put(UserController());
        }),
      ),
    );
  }
}
