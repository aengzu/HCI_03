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
import 'package:hci_03/screens/main_screens.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';
import '../../constants/image_assets.dart';
import '../../controllers/user_controller.dart';
import '../../models/task.dart';
import 'battle_accept_screen3.dart';


class BattleAcceptScreen2 extends StatelessWidget {
  final BattleController battleController = Get.put(BattleController());
  final TaskController taskController = Get.put(TaskController());
  final UserController userController = Get.find<UserController>();

  BattleAcceptScreen2({super.key});

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
            child: NoticeBox(notice: dummyNotices[6]), // 공지 박스
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            '내 태스크',
            style: textTheme().titleMedium,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical:0.01.sw, horizontal: 0.1.sw),
            child: Text("아래의 추천 목표에는 상대방이 직접 입력한 목표도 포함되어 있어요", style: textTheme().bodySmall),
          ),
          SizedBox(height: screenHeight * 0.01),
          Container(
            height: screenHeight * 0.43,
            child: TaskContainer(), // 태스크 리스트들 담는 위젯
          ),
          SizedBox(height: screenHeight * 0.02),
          CustomButtonLight(
            label: '다음으로',
            onPressed: () async {
              // 선택된 태스크들을 가져옴
              List<Task> selectedTasks = taskController.getSelectedTasks();
              String taskNos = selectedTasks.map((task) => task.taskNo.toString()).join(',');

              try {
                await battleController.acceptBattle(taskNos);
                Get.to(MainScreens());
              } catch (e) {
                Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
              }
            },
          ),
        ],
      ),
    );
  }
}
