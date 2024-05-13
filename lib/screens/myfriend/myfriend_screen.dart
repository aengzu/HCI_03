import 'package:flutter/material.dart';
import 'package:hci_03/screens/myfriend/components/friends_header.dart';

import '../../constants/image_assets.dart';
import '../../constants/theme.dart';
import '../components/appbar_preffered_size.dart';
import '../components/custom_btn.dart';

class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
    actions: [
    IconButton(
    icon: Icon(Icons.settings), // 설정 아이콘
    onPressed: () {}, // 아이콘 버튼 클릭 이벤트 처리
    ),],
          bottom: appBarBottomLine(),),
        body: Column(
            children: [
              FriendsHeader(),
            ],
        ),
    );
  }
}
