import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/battle_controller.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/models/request_title.dart';
import 'package:hci_03/screens/battle_request/components/task_container.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:provider/provider.dart';
import '../../constants/image_assets.dart';
import '../../controllers/user_controller.dart';
import '../../models/task.dart';
import 'battle_request_screen3.dart';

class BattleRequestScreen2 extends StatelessWidget {
  final Friend friend;
  final BattleController battleController = Get.put(BattleController());
  final TaskController taskController = Get.put(TaskController());
  final UserController userController = Get.find<UserController>();

  BattleRequestScreen2({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(ImageAssets.logo, width: 100),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[0]), // 공지 박스
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            '내 태스크',
            style: textTheme().titleMedium,
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.43,
            child: TaskContainer(), // 태스크 리스트들 담는 위젯
          ),
          SizedBox(height: screenHeight * 0.06),
          CustomButtonLight(
            label: '다음으로',
            onPressed: () async {
              // 선택된 태스크들을 가져옴
              List<Task> selectedTasks = taskController.getSelectedTasks();
              String tasks = selectedTasks.map((task) => task.taskName).join(', ');

              // 버튼 클릭시 대결 신청 요청을 보냄
              await battleController.registerBattle(
                friend.memberId, // 현재 친구의 ID
                userController.user.value.memberId, // 실제 로그인된 사용자의 ID
                tasks, // 선택된 태스크들
              );
              // TODO : 현재 수준에선 배틀 신청 시 이를 상대가 받지 않으면 대결 정보가 보이지 않음
              // TODO: -> 따라서 배틀 신청 하자마자 수락하도록 코드를 작성하였으나 서버측의 수정으로 수정될 수 있음
              // var battleNo = battleController.fetchBattle(userController.user.value.memberId);
              // await battleController.acceptBattle(
              //   battleNo as int,
              //   friend.memberId, // 현재 친구의 ID
              //   userController.user.value.memberId, // 실제 로그인된 사용자의 ID
              //   tasks, // 선택된 태스크들
              // );

              if (battleController.errorMessage.value.isNotEmpty) {
                Get.snackbar('Error', battleController.errorMessage.value, snackPosition: SnackPosition.BOTTOM);
              } else {
                // 대결 신청 완료 화면으로 이동
                Get.to(()=>BattleRequestScreen3(friend: friend));
              }
            },
          ),
        ],
      ),
    );
  }
}
