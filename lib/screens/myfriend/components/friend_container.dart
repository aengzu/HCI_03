
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';

class FriendContainer extends StatelessWidget {
  const FriendContainer({
    Key? key,
    required this.friend,
  }) : super(key: key);

  final Friend friend; // 채팅 메시지 객체 선언

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border(
          bottom: BorderSide(color:  Colors.grey, width: 0.9),
        ),
      ),
      height: 90, // 컨테이너 높이 설정
      child: Padding(
        padding: const EdgeInsets.all(10), // 모든 측면에 20의 패딩 적용
        child: Row(
          children: [
            Image.asset(friend.profileImage, width: 80, height: 80),
            const SizedBox(width: 16.0), // 이미지와 텍스트 사이의 간격 설정
            Text(friend.name, style: textTheme().bodyLarge,overflow: TextOverflow.ellipsis, textAlign: TextAlign.start,),
          ],
              ),
            ),
            );
  }
}
