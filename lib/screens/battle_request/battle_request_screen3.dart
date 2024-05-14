import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:provider/provider.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle_request/components/task_container.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:hci_03/constants/image_assets.dart';
import '../../opponent_provider.dart';
import '../components/appbar_preffered_size.dart';
import 'package:hci_03/models/friend.dart';

class BattleRequestScreen3 extends StatelessWidget {
  const BattleRequestScreen3({super.key});

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
          _buildProfile(currentOpponent),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[2]), // 공지 박스로 dummyData 값을 활용했습니다.
          ),
          SizedBox(height: 100),
          CustomButtonLight(
            label: '확인',
            onPressed: () {
              // Handle the button press
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BattleScreen();
                },
              ));
            },
          ),


        ],
      ),
    );
  }

  Widget _buildProfile(Friend? opponent) {
    // 현재 대결 상대가 없을 경우엔 따로 처리합니다.
    if (opponent == null) {
      return Container(
        child: Column(
          children: [
            Text("No Opponent Selected", style: textTheme().titleMedium),
            SizedBox(height: 10),
          ],
        ),
      );
    }
    // 그 외에는 현재 대결 상대의 정보를 get 할 수 있습니다.
    return Container(
      child: Column(
        children: [
          Text(opponent.name, style: textTheme().titleMedium),
          SizedBox(height: 15),
          Image.asset(opponent.profileImage, width: 180, height: 180),
          SizedBox(height: 10),
          Text(opponent.bio, style: textTheme().bodyMedium),
        ],
      ),
    );
  }
}
