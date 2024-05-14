import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/myfriend/components/current_oppononent_box.dart';
import 'friend_container.dart';
import 'package:hci_03/models/friend.dart';

class FriendsBody extends StatelessWidget {
  const FriendsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrentOpponentBox(),
            const SizedBox(height: 40.0),
            Text(
              '모든 친구 목록',
              style: textTheme().titleMedium,
            ),
            const SizedBox(height: 15.0),
            const Divider(thickness: 0.9, color: Colors.grey),
            Expanded(
              child: ListView.builder(
                itemCount: dummyFriends.length, // 첫 번째 친구는 위에서 사용됨
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FriendContainer(friend: dummyFriends[index]),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
