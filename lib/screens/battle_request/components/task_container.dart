import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/task.dart';
import 'package:hci_03/screens/battle_request/components/task_add_dialog.dart';
import 'package:hci_03/screens/battle_request/components/task_addbtn.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';
import 'package:sizing/sizing.dart';

class TaskContainer extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (taskController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (taskController.errorMessage.value.isNotEmpty) {
        return Center(child: Text(taskController.errorMessage.value));
      } else {
        return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          itemCount: taskController.tasks.length + 1, // 마지막에 버튼 추가하려고 length +1
          itemBuilder: (context, index) {
            if (index < taskController.tasks.length) {
              final task = taskController.tasks[index];
              return TaskItem(
                task: task,
                onToggleCheck: (task) {
                  taskController.toggleTask(task);
                },
              );
            } else {
              return TaskAddButton(addTask: (taskName, emoji) {
                taskController.registerTask(taskName); // TaskController의 registerTask 함수 호출
              });
            }
          }
        );
      }
    });
  }
}
