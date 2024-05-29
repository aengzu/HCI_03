import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/controllers/battle_controller.dart';
import 'package:hci_03/screens/battle/components/battle_opposite_profile_widget.dart';
import 'package:hci_03/screens/battle/components/battle_profile_widget.dart';
import 'package:hci_03/screens/battle/components/missions_widget.dart';
import 'package:hci_03/screens/battle/components/promise_widget.dart';
import 'package:hci_03/models/battle.dart';

import '../../constants/image_assets.dart';
import '../components/appbar_preffered_size.dart';

class BattleScreen extends StatelessWidget {
  final Battle battle;

  BattleScreen({required this.battle, super.key});

  @override
  Widget build(BuildContext context) {
    final BattleController battleController = Get.find<BattleController>();

    // 사용자 ID 가져오기
    final userId = battleController.userController.user.value.memberId;

    // 태스크를 그룹화하여 같은 태스크를 한 줄에 표시하기 위한 리스트 생성
    List<Map<String, dynamic>> missions = battleController.getGroupedMissions(userId);


    return Scaffold(
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // 설정 아이콘
            onPressed: () {}, // 아이콘 버튼 클릭 이벤트 처리
          ),
        ],
        bottom: appBarBottomLine(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            const PromiseWidget(),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BattleProfileWidget(
                  isProfileClicked: false,
                  percentage: 0.0,
                  onClickProfile: () {},
                ),
                BattleOppositeProfileWidget(
                  opponentName: battleController.opponentName,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                itemCount: missions.length,
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                itemBuilder: (BuildContext context, int index) {
                  return MissionsWidget(
                    mission: missions[index],
                    onMissionClick: (idx) {
                      // 팝업 띄움
                      battleController.onClickCertification(context, missions[idx]['taskName'], missions[idx]['battleNo'], missions[idx]['taskNo']);
                    },
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
