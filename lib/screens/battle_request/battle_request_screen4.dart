import 'package:flutter/material.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/screens/battle/battle_screen.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/notice_box.dart';
import 'package:provider/provider.dart';
import '../../constants/image_assets.dart';
import '../../models/request_title.dart';
import '../../models/task.dart';
import '../../opponent_provider.dart';
import '../../task_provider.dart';

class BattleRequestScreen4 extends StatelessWidget {
  const BattleRequestScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    Friend? currentOpponent = Provider.of<OpponentProvider>(context).currentOpponent;
    TaskController taskController = TaskController();
    TaskProvider taskProvider = TaskProvider();

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
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: NoticeBox(notice: dummyNotices[3]),
          ),
          SizedBox(height: 20),
          _buildTaskSection("상대방과 나의 공통 목표", taskController.getBothSelectedTasks(), taskController, context),
          SizedBox(height: 20),
          _buildTaskSection("상대방이 직접 입력한 목표", taskController.getOpponentSelectedTasks(), taskController, context),
          SizedBox(height: 40),
          CustomButtonLight(
            label: '확인',
            onPressed: () {
              // Provider 가 관리하는 최종 태스크 목록에 체크된 애들 저장하기
              taskController.saveTasks(taskProvider);
              // 저장 잘 됐는 지 테스트
              print('체크된 테스크들');
              print(taskProvider.tasks.map((e) => e.title));
              // 배틀 화면으로 이동
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return BattleScreen();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTaskSection(String title, List<Task> tasks, TaskController taskController, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(height: 10),
        ...tasks.map((task) => _buildTaskItem(task, taskController, context)).toList(),
      ],
    );
  }

  Widget _buildTaskItem(Task task, TaskController taskController, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 50,
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
            GestureDetector(
              onTap: () {
                Provider.of<TaskProvider>(context, listen: false).toggleTaskCheck(task);
              },
              child: Consumer<TaskProvider>(
                builder: (context, taskProvider, child) {
                  return Icon(
                    task.isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: task.isChecked ? Colors.green : Colors.grey,
                  );
                },
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
