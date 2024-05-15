import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/opponent_provider.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen2.dart';
import 'package:hci_03/screens/battle_request/components/custom_textfield.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:provider/provider.dart';
import '../../constants/image_assets.dart';
// NOTE: 대결 신청하기(상대방 검색) UI
class BattleRequestScreen1 extends StatelessWidget {
  const BattleRequestScreen1({super.key});

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[0]),
          ),
          SizedBox(height: 40),
          _buildProfile(), // 프로필 생성
          SizedBox(height: 40),
          CustomTextField(),
          SizedBox(height: 50),
          CustomButtonLight(
            label: '대결 상대 신청',
            onPressed: () {
              // 더미 데이터를 currnetOpponenet 로 설정
              Friend dummyOpponent = Friend(
                id: "dummy",
                name: "🐶길동이",
                profileImage: ImageAssets.sender,
                bio: "저는 길동이에요",
              );
              // 만약 버튼을 누르면 위 더미데이터를 Provider 에 전달해서 현재 배틀 상대를 설정해뒀습니다.
              // 다른 분들 작업하실 때 OpponentProvide 에 접근하여 현재 배틀 상대 가져올 수 있습니다. (반환값 : null or dummyOpponent)
              // 현재는 이름, 아이디, 프로필이미지, bio만 있지만 이를 수정하려면 friend model 코드 자체를 수정해도 됩니다.
              Provider.of<OpponentProvider>(context, listen: false).setCurrentOpponent(dummyOpponent);

              // 다음 화면 이동 (대결 태스크 설정)
              Navigator.push(context, MaterialPageRoute(
                builder: (context) { // 다음 설정 화면으로 이동
                  return BattleRequestScreen2();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  // 프로필 이미지 생성 build 함수
  Widget _buildProfile() {
    return Container(
      child: Column(
        children: [
          Image.asset(ImageAssets.sender, width: 180, height: 180),
          SizedBox(height: 10),
          Text('상대방 프로필', style: textTheme().titleMedium),
        ],
      ),
    );
  }
}
