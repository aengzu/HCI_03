import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/battle/spur_on_screen.dart';
import 'package:hci_03/controllers/battle_controller.dart';

class BattleOppositeProfileWidget extends StatelessWidget {
  final BattleController battleController = Get.find<BattleController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (battleController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (battleController.errorMessage.value.isNotEmpty) {
        return Center(child: Text(battleController.errorMessage.value));
      } else {
        final String opponentName = battleController.opponentName.value;

        return Column(
          children: [
            Text(
              opponentName,
              style: textTheme().titleMedium,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Image.asset(
              'assets/images/sender_img.png',
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
                    return SpurOnScreen();
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
    });
  }
}
