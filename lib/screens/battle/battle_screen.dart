import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hci_03/screens/battle/components/battle_opposite.profile_widget.dart';
import 'package:hci_03/screens/battle/components/battle_profile_widget.dart';
import 'package:hci_03/screens/battle/components/missions_widget.dart';
import 'package:hci_03/screens/battle/components/promise_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/image_assets.dart';
import '../../opponent_provider.dart';
import '../components/appbar_preffered_size.dart';

class BattleScreen extends StatefulWidget {
  BattleScreen({
    super.key,
  });

  // 이건 더미임
  List<Map> missions = [
    {"mission_name": "비타민 먹기 💊", "checked": false},
    {"mission_name": "아침식사하기 🥘", "checked": false},
    {"mission_name": "선크림 바르기 🌞", "checked": false},
    {"mission_name": "도서관 가기 📚", "checked": false},
  ];

  bool isProfileClicked = false;

  double percentage = 0.0;

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  void onMissionClick(index) {
    setState(() {
      widget.missions[index]["checked"] = !widget.missions[index]["checked"];
      widget.percentage = calculateSuccess();
    });
  }

  void onClickProfile() {
    setState(() {
      widget.isProfileClicked = !widget.isProfileClicked;
    });
  }

  double calculateSuccess() {
    var s =
        widget.missions.where((element) => element["checked"] == true).length;
    double percentage = (s / widget.missions.length) * 100.0;
    return percentage;
  }

  @override
  Widget build(BuildContext context) {

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
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BattleProfileWidget(
                    isProfileClicked: widget.isProfileClicked,
                    percentage: widget.percentage,
                    onClickProfile: onClickProfile,
                  ),
                  const BattleOppositeProfileWidget(),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.missions.length,
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  itemBuilder: (BuildContext context, int index) {
                    return MissionsWidget(
                      mission: widget.missions[index],
                      onMissionClick: onMissionClick,
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
