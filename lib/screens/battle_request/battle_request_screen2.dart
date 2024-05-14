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

class BattleRequestScreen2 extends StatelessWidget {
  const BattleRequestScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // NOTE: Provider 를 통해 현재 대결 상대에 접근 가능합니다.
    Friend? currentOpponent = Provider.of<OpponentProvider>(context).currentOpponent;

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
            child: NoticeBox(notice: dummyNotices[1]),
          ),
          SizedBox(height: 40),
          Container(
            height: 350,
            child: TaskContainer(),
          ),
          SizedBox(height: 50),
          CustomButtonLight(
            label: '다음으로',
            onPressed: () {
              // 현재 대결상대 잘 들어갔는지 테스트
              print("Current Opponent: ${currentOpponent?.name}");
              // 완료 화면 이동
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
