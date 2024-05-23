import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hci_03/controllers/task_controller.dart';
import 'package:hci_03/models/task.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';

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
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return TaskItem(
              task: task,
              onToggleCheck: (task) {
                taskController.toggleTask(task);
              },
            );
          },
        );
      }
    });
  }
}
