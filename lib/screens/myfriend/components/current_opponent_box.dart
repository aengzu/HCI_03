import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';
import 'package:hci_03/controllers/battle_controller.dart';
import 'package:hci_03/controllers/user_controller.dart';

class CurrentOpponentBox extends StatelessWidget {
  final BattleController battleController = Get.find<BattleController>();
  final UserController userController = Get.find<UserController>();

  CurrentOpponentBox({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Obx(() {
      if (battleController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (battleController.errorMessage.value.isNotEmpty) {
        return Center(child: Text(battleController.errorMessage.value));
      } else {
        Friend? currentOpponent;
        if (battleController.battle.value.challengee.isNotEmpty) {
          currentOpponent = Friend(
            memberNo: 0,
            memberId: battleController.battle.value.challengee,
            password: '',
            name: battleController.opponentName.value,
            deviceKey: '',
          );
        }

        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('현재 대결 상대', style: textTheme().titleMedium),
              SizedBox(height: screenHeight * 0.02),
              const Divider(thickness: 0.9, color: Colors.grey),
              currentOpponent == null
                  ? _buildNoOpponentMessage(context)
                  : FriendContainer(friend: currentOpponent),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        );
      }
    });
  }

  Widget _buildNoOpponentMessage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * 0.02),
        Text('현재 대결 상대가 없습니다.', textAlign: TextAlign.center),
        SizedBox(height: screenHeight * 0.02),
        const Divider(thickness: 0.9, color: Colors.grey),
      ],
    );
  }
}
