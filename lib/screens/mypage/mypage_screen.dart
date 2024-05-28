import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/user_controller.dart';
import 'package:hci_03/screens/mypage/components/achievements_section.dart';
import 'package:hci_03/screens/mypage/components/profile_section.dart';
import '../components/appbar_preffered_size.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();

    // 유저 컨트롤러로 정보 페치해옴.
    String name = utf8.decode(userController.user.value.name.codeUnits);
    String id = utf8.decode(userController.user.value.memberId.codeUnits);
    String bio = "bio";
    String profileImage = ImageAssets.receiver;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: Icon(Icons.settings), // 설정 아이콘
            onPressed: () {}, // 아이콘 버튼 클릭 이벤트 처리
          ),
        ],
        bottom: appBarBottomLine(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.05.sh),
          _buildProfile(profileImage),
          Text(id, style: textTheme().titleMedium),
          SizedBox(height: 0.02.sh),
          ProfileSection(title: "이름", content: name),
          SizedBox(height: 0.05.sh),
          ProfileSection(title: "소개", content: bio),
          SizedBox(height: 0.05.sh),
          AchievementsSection(title: "업적"),
        ],
      ),
    );
  }

  Widget _buildProfile(String imageUrl) {
    if (imageUrl.isEmpty) {
      return const CircleAvatar(
        radius: 55.5,
        backgroundColor: Color(0xffaac0af), // 더미 이미지 색상
        child: Icon(
          Icons.person, // 더미 아이콘
          size: 70,
          color: Colors.white,
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(55.5), // 이미지 모서리 둥글기
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover, // 이미지 채우기 방식
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0, // 포지션 조정
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // 모서리 둥글기
              color: Colors.grey[100], // 배경색
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              size: 15, // 아이콘 크기
            ),
          ),
        ),
      ],
    );
  }
}
