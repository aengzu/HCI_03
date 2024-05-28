import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen1.dart';
import 'package:hci_03/controllers/battle_controller.dart';

import '../../battle_request/batte_message_screen.dart';

class FriendContainer extends StatelessWidget {
  FriendContainer({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final Friend friend; // 친구 객체 설정
  final BattleController battleController = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.9),
        ),
      ),
      height: 90, // 컨테이너 높이 설정
      child: Padding(
        padding: const EdgeInsets.all(10), // 모든 측면에 10의 패딩 적용
        child: Row(
          children: [
            Image.asset(ImageAssets.receiver, width: 80, height: 80),
            SizedBox(width: screenWidth * 0.035), // 이미지와 텍스트 사이의 간격 설정
            Expanded(
              child: Text(
                friend.name,
                style: textTheme().bodyLarge,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: () {
                if (battleController.battle.value.challengee.isNotEmpty) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BattleMessageScreen(
                        message: '이미 배틀 상대가 존재합니다',
                      );
                    },
                  ));
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BattleRequestScreen1(friend: friend);
                    },
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
