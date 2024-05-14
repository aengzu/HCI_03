import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';

// NOTE: CurrentOpponentBox :  현재 대결 상대를 표시하는 컨테이너
class CurrentOpponentBox extends StatelessWidget {
  const CurrentOpponentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 현재 대결 상대라는 제목을 표시하는 텍스트
          Text(
            '현재 대결 상대',
            style: textTheme().titleMedium,
          ),
          const SizedBox(height: 15.0), // 간격을 주기 위한 SizedBox
          const Divider(thickness: 0.9, color: Colors.grey), // 구분선
          // currentOpponent가 null이라면 '현재 대결 상대가 없습니다.'라는 텍스트를 표시하고,
          // 그렇지 않다면 FriendContainer에 currentOpponent를 전달하여 표시
          currentOpponent == null
              ?
              _buildNoOpponentMessage()
              : FriendContainer(friend: currentOpponent!),
        ],
      ),
    );
  }
  // NOTE: _buildNoOpponentMessage : '현재 대결 상대가 없습니다' 메시지를 빌드하는 함수
  Widget _buildNoOpponentMessage() {
    return const Column(
      children: [
        SizedBox(height: 20.0), // 간격을 주기 위한 SizedBox
        Text('현재 대결 상대가 없습니다.'), // 대결 상대가 없다는 메시지
        SizedBox(height: 20.0), // 간격을 주기 위한 SizedBox
        Divider(thickness: 0.9, color: Colors.grey), // 구분선
      ],
    );
  }



}

