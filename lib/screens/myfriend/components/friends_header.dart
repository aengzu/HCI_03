import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hci_03/constants/colors.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/myfriend/components/custom_searchbar.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';
import 'custom_dialog.dart'; // 커스텀 다이얼로그 파일 임포트

import 'friends_body.dart';

class FriendsHeader extends StatelessWidget {
  final FriendController controller;

  const FriendsHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16), // 상하 20, 좌우 16 패딩
        child: Stack(
          children: [
            // 가운데 위치한 텍스트 타이틀
            Center(
              child: Text(
                '친구 목록',
                style: textTheme().titleLarge, // 텍스트 스타일
              ),
            ),
            // 오른쪽에 위치한 친구 추가 아이콘
          ],
        ),
      ),
    );
  }
}
