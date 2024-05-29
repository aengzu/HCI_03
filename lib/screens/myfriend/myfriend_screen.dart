import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hci_03/controllers/user_controller.dart';
import 'package:hci_03/screens/myfriend/components/friends_header.dart';
import '../../constants/image_assets.dart';
import '../../controllers/battle_controller.dart';
import '../../controllers/friends_controller.dart';
import '../components/appbar_preffered_size.dart';
import 'components/friends_body.dart';

class FriendScreen extends StatelessWidget {
  final FriendController friendsController = Get.put(FriendController());
  final UserController userController = Get.find<UserController>();




  @override
  Widget build(BuildContext context) {

    // 로그인된 사용자의 아이디를 사용하여 친구 목록을 가져옵니다.
    friendsController.fetchFriends(userController.user.value.memberId);

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
          FriendsHeader(),
          Expanded(
            child: FriendsBody(controller: friendsController), // FriendsBody를 Expanded로 감싸서 사용합니다.
          ),
        ],
      ),
    );
  }
}
