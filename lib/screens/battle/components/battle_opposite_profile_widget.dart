import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/battle/spur_on_screen.dart';

import '../../../controllers/battle_controller.dart';

class BattleOppositeProfileWidget extends StatelessWidget {
  final String opponentName;
  final BattleController battleController = Get.find<BattleController>();

  BattleOppositeProfileWidget({required this.opponentName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          opponentName.isNotEmpty ? opponentName : '없음',
          style: textTheme().titleMedium,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Image.asset(
          battleController.getOpponentProfileImage(),
          width: 120,
          height: 120,
        ),
        const SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SpurOnScreen(opponentName: opponentName);
              },
            ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xff4cd663).withOpacity(0.7),
                borderRadius: BorderRadius.circular(12)),
            width: 120,
            child: Text(
              ' 격려하기 👍🏻',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
          ),
        )
      ],
    );
  }
}
