import 'package:flutter/material.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/task.dart';
import 'package:hci_03/screens/battle_request/components/task_addbtn.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';

class TaskContainer extends StatelessWidget {

  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // 태스크 컨트롤러를 통해 띄우게 될 더미 태스크 가져옴
    List<Task> tasks = taskController.defualtTasks;

    return Container(
      width: screenWidth * 0.80,
      child: ListView.builder(
        itemCount: tasks.length + 1,
        itemBuilder: (context, index) {
          if (index == tasks.length) {
            // 태스크 추가하기 클릭 시
            return TaskAddButton(addTask: (title, emoji) {
              taskController.defualtTasks.add(Task(title: title, emoji: emoji, isChecked: false));
            });
          } else {
            // 태스크 아이템 리턴
            return TaskItem(task: tasks[index]);
          }
        },
      ),
    );
  }
}
