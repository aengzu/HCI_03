import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen2.dart';
import 'package:hci_03/screens/battle_request/components/custom_textfield.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/grey_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';
import '../../constants/image_assets.dart';
import 'battle_accept_screen2.dart';

class BattleAcceptScreen1 extends StatelessWidget {

  const BattleAcceptScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: NoticeBox(notice: dummyNotices[5]),
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildProfile(), // 프로필 생성

            SizedBox(height: screenHeight * 0.05),
            CustomButtonLight(
              label: '대결 상대 신청',
              onPressed: () {
                Get.to(BattleAcceptScreen2());
              },
            ),
            SizedBox(height: screenHeight * 0.015),
            GreyButton(label: "거절하기", onPressed: (){})
          ],
        ),
      ),
    );
  }

  // 프로필 이미지 생성 build 함수
  Widget _buildProfile() {
    return Container(
      child: Column(
        children: [
          Image.asset(ImageAssets.receiver, width: 180, height: 180),
          SizedBox(height: 10),
          Text("친구", style: textTheme().titleMedium),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.15.sw),
            child: Text("안녕", style: textTheme().bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis,),
          ),
        ],
      ),
    );
  }
}
