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
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('현재 대결 상대', style: textTheme().titleMedium),
          SizedBox(height: screenHeight*0.02),
          const Divider(thickness: 0.9, color: Colors.grey),
          currentOpponent == null
              ? _buildNoOpponentMessage(context)
              : FriendContainer(friend: currentOpponent!),
          SizedBox(height: screenHeight*0.02),
        ],
      ),
    );
  }

  Widget _buildNoOpponentMessage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Column(
      children: [
        SizedBox(height: screenHeight*0.02),
        Text('현재 대결 상대가 없습니다.', textAlign: TextAlign.center),
        SizedBox(height:  screenHeight*0.02),
        const Divider(thickness: 0.9, color: Colors.grey),
      ],
    );
  }
}
