import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/battle_request/battle_request_screen1.dart';

class FriendContainer extends StatelessWidget {
  const FriendContainer({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final Friend friend; // 친구 객체 설정

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border(
          bottom: BorderSide(color:  Colors.grey, width: 0.9),
        ),
      ),
      height: 90, // 컨테이너 높이 설정
      child: Padding(
        padding: const EdgeInsets.all(10), // 모든 측면에 10의 패딩 적용
        child: Row(
          children: [
            Image.asset(friend.profileImage, width: 80, height: 80),
            SizedBox(width: screenWidth * 0.035), // 이미지와 텍스트 사이의 간격 설정
            Expanded(
              child: Text(
                friend.name,
                style: textTheme().bodyLarge,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            IconButton(icon: Icon(Icons.chevron_right), onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BattleRequestScreen1(friend: friend);
                },
              ));
            }),
          ],
        ),
      ),
    );
  }
}
