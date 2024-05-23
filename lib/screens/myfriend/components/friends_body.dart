import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/friends_controller.dart';
import 'package:hci_03/controllers/user_controller.dart';
import 'package:hci_03/screens/myfriend/components/current_opponent_box.dart';
import 'package:hci_03/screens/myfriend/components/custom_dialog.dart';
import 'package:hci_03/screens/myfriend/components/friend_container.dart';

class FriendsBody extends StatelessWidget {
  final FriendController controller;
  final UserController userController = Get.find<UserController>();

  FriendsBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;


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
                          // 친구 추가 로직 구현
                          controller.registerFriend(friendId, userController.user.value.memberId);
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
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.value.isNotEmpty) {
                return Center(child: Text(" "));
              } else {
                return ListView.builder(
                  itemCount: controller.friends.length,
                  itemBuilder: (context, index) {
                    final friendResponse = controller.friends[index];
                    final friend = friendResponse.friendId;
                    return FriendContainer(friend: friend);
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
