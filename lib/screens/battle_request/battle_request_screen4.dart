import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:hci_03/screens/main_screens.dart';
import 'package:provider/provider.dart';
import '../../constants/image_assets.dart';
import '../../models/request_title.dart';
import '../../models/task.dart';
import '../../opponent_provider.dart';
// NOTE: 대결 태스크 최종 공지 UI
class BattleRequestScreen4 extends StatelessWidget {

  const BattleRequestScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    TaskController taskController = Provider.of<TaskController>(context);

    return Scaffold(
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
          SizedBox(height: screenHeight*0.03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[3]),
          ),
          SizedBox(height: screenHeight*0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("상대방과 나의 공통 목표", style: textTheme().titleMedium),
          ),

          SizedBox(height: screenHeight*0.01),
          Container(height: screenHeight*0.25, child:_buildTaskSection(taskController.defualtTasks, taskController, context)),
          SizedBox(height: screenHeight*0.04),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("상대방이 직접 입력한 목표", style: textTheme().titleMedium),
          ),

          SizedBox(height: screenHeight*0.01),
          Container(height:screenHeight*0.15, child: _buildTaskSection(taskController.defualtTasks, taskController, context)),
          SizedBox(height: screenHeight*0.03),
          CustomButtonLight(
            label: '확인',
            onPressed: () {
          //    taskController.saveTasks();
              // 배틀 화면으로 이동
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  // 일단 누르면 main 배틀 화면으로 이
                  return MainScreens();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  // 태스크 리스트 섹션 build
  Widget _buildTaskSection(List<Task> tasks, TaskController taskController, BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...tasks.map((task) => _buildTaskItem(task, taskController, context)).toList(),
          ],
        ),
      ),
    );
  }

  // 태스크 아이템 build
  Widget _buildTaskItem(Task task, TaskController taskController, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 49,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // 만약 체크 클릭시 체크 표시되도록
            GestureDetector(
              onTap: () {
                taskController.toggleTask(task);
              },
              child: Icon(
                task.isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                color: task.isChecked ? Colors.green : Colors.grey,
              ),
            ),
            SizedBox(width: 10),
            Text(task.title + " " + task.emoji),
          ],
        ),
      ),
    );
  }
}
