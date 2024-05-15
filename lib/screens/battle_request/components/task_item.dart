import 'package:flutter/material.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/models/task.dart';
import 'package:provider/provider.dart';


import '../../../task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Container(
        width: screenWidth * 0.80,
        height: 62.0, // Fixed height
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
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0), // 왼쪽에 패딩 추가
            child: GestureDetector(
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
          ),
          title: Text(task.title + " " + task.emoji),
        ),
      ),
    );
  }
}
