import 'package:flutter/material.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';

import '../../../controllers/friends_controller.dart';
import 'current_opponent_box.dart';
import 'custom_dialog.dart';

class FriendsBody extends StatelessWidget {
  final FriendsController controller;

  const FriendsBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentOpponentBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '모든 친구 목록',
                style: textTheme().titleMedium,
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.person_add, color: Colors.black),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: '친구 추가',
                        hintText: '친구의 아이디를 입력하세요',
                        onConfirm: (friendId) {
                             // 추가로직 구현
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          const Divider(thickness: 0.9, color: Colors.grey),
          Expanded(
            child: ListView.builder(
              itemCount: controller.friends.length,
              itemBuilder: (context, index) {
                return FriendContainer(friend: controller.friends[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
