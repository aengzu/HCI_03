import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/screens/battle_request/components/task_addbtn.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';

class TaskContainer extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  TaskContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      // 처음 띄울 태스크 목록을 listview 로 표시합니다.
      child: Obx(() {
        return ListView.builder(
          itemCount: taskController.defualtTasks.length + 1,
          itemBuilder: (context, index) {
            if (index == taskController.defualtTasks.length) {
              return TaskAddButton( // 태스크 '직접 입력하기' 버튼을 클릭하면 현재 뷰에 추가함
                addTask: (title, emoji) {
                  taskController.addTask(title, emoji);
                },
              );
            } else {
              return TaskItem(
                task: taskController.defualtTasks[index],
                onToggleCheck: (task) {
                  taskController.toggleTask(task);
                },
              );
            }
          },
        );
      }),
    );
  }
}
