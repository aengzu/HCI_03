import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen4.dart';
import 'package:provider/provider.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle_request/components/task_container.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:sizing/sizing.dart';
import '../components/appbar_preffered_size.dart';
import 'package:hci_03/models/friend.dart';

class FriendDetailScreen extends StatelessWidget {
  const FriendDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight*0.03),
         // _buildProfile(currentOpponent),
          SizedBox(height: screenHeight*0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[2]), // 공지 박스 컨텐트는 더미데이터로 접근
          ),
          SizedBox(height: screenHeight*0.09),
          CustomButtonLight(
            label: '확인',
            onPressed: () {
              // 버튼 클릭시 최종 태스크 안내 화면으로 이동
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BattleRequestScreen4();
                },
              ));
            },
          ),


        ],
      ),
    );
  }

  // 프로필 생성 build함수
  Widget _buildProfile(Friend? opponent) {
    // 현재 대결 상대가 없을 경우엔 따로 처리
    if (opponent == null) {
      return Container(
        child: Column(
          children: [
            Text("No Opponent Selected", style: textTheme().titleMedium),
            SizedBox(height: 10.0),
          ],
        ),
      );
    }
    // 그 외에는 현재 대결 상대의 정보를 get 할 수 있습니다.
    return Container(
      child: Column(
        children: [
          Text("길동", style: textTheme().titleMedium),
          SizedBox(height: 0.015.sh),
          Image.asset(ImageAssets.receiver, width: 180, height: 180),
          SizedBox(height: 0.01.sh),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.15.sw),
            child: Text("안녕", style: textTheme().bodyMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
