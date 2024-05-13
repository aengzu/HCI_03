import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hci_03/screens/battle/spur_on_screen.dart';

class BattleOppositeProfileWidget extends StatelessWidget {
  const BattleOppositeProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '길동이',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
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
          height: 15.0,
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
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xff4cd663).withOpacity(0.7),
                borderRadius: BorderRadius.circular(12)),
            width: 120,
            child: Text(
              '격려하기 👍🏻',
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
