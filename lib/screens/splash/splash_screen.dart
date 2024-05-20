// NOTE: splash_screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/controllers/splash_controller.dart';
import 'package:sizing/sizing.dart';


class SplashScreen extends StatelessWidget {
  // NOTE : 스플래시 스크린 UI 구현부입니다.
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Color(0xff8BE499),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 0.03.sw),
              Image.asset(ImageAssets.logo, height: 0.9.sh, width: 0.9.sw),
            ],
          ),),

      ),
    );
  }
}
