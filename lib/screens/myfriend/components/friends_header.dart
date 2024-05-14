import 'package:flutter/material.dart'; // 플러터 머티리얼 디자인 라이브러리
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Font Awesome 아이콘 라이브러리
import 'package:hci_03/constants/colors.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/myfriend/components/custom_searchbar.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';

import 'friends_body.dart';

class FriendsHeader extends StatelessWidget {
  const FriendsHeader({super.key}); // 생성자

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
            Positioned(
              right: 0,
              child: IconButton(
                padding: EdgeInsets.only(bottom: 10),
                iconSize: 30,
                icon: Icon(Icons.person_add, color: Colors.black), // 친구 추가 아이콘
                onPressed: () {
                  // 아이콘 클릭 시 팝업

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
