import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen1.dart';
import 'package:hci_03/screens/components/small_btn.dart';
import 'package:hci_03/screens/myfriend/components/custom_dialog.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';

class CurrentOpponentBox extends StatelessWidget {
  final Friend? currentOpponent;

  const CurrentOpponentBox({
    super.key,
    this.currentOpponent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('현재 대결 상대', style: textTheme().titleMedium),
          const SizedBox(height: 15.0),
          const Divider(thickness: 0.9, color: Colors.grey),
          currentOpponent == null
              ? _buildNoOpponentMessage(context)
              : FriendContainer(friend: currentOpponent!),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNoOpponentMessage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Text('현재 대결 상대가 없습니다.', textAlign: TextAlign.center),
        SizedBox(height: 10.0),
        SmallButton(label: "아이디로 추가하기", onPressed: () {

          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BattleRequestScreen1();
            },
          ));
        }),
        SizedBox(height: 10.0),
        const Divider(thickness: 0.9, color: Colors.grey),
      ],
    );
  }
}
