import 'package:flutter/material.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/screens/myfriend/components/friends_header.dart';
import '../../constants/image_assets.dart';
import '../../constants/theme.dart';
import '../components/appbar_preffered_size.dart';
import '../components/custom_btn.dart';
import 'components/current_opponent_box.dart';
import 'components/friends_body.dart';


class FriendScreen extends StatelessWidget {
  final FriendsController friendsController = FriendsController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
        children: [
          FriendsHeader(controller: friendsController),
          Expanded(
            child: FriendsBody(controller: friendsController), // FriendsBody를 Expanded로 감싸서 사용합니다.
          ),
        ],
      ),
    );
  }
}
