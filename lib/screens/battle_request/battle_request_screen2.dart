import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/opponent_provider.dart';
import 'package:hci_03/screens/battle_request/components/task_container.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:provider/provider.dart';
import '../../constants/image_assets.dart';
import 'battle_request_screen3.dart';
// NOTE: 태스크 설정 화면 UI
class BattleRequestScreen2 extends StatelessWidget {
  const BattleRequestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    // NOTE: Provider 를 통해 현재 대결 상대에 접근
    Friend? currentOpponent = Provider.of<OpponentProvider>(context).currentOpponent;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // 상단바
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[1]), // 공지 박스
          ),
          SizedBox(height: screenHeight*0.01),
          Text('내 태스크', style: textTheme().titleMedium,),
          SizedBox(height: screenHeight*0.01),
          Container(
            height: screenHeight*0.43,
            child: TaskContainer(), // 태스크 리스트들 담는 위젯
          ),
          SizedBox(height: screenHeight*0.06),
          CustomButtonLight(
            label: '다음으로',
            onPressed: () {
              // 현재 대결 상대 잘 저장됐는지 테스
              print(currentOpponent?.name);
              // 버튼 클릭시 대결 신청 완료 화면 이동
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BattleRequestScreen3();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
