import 'package:flutter/material.dart';
import 'package:hci_03/models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(Task) onToggleCheck;

  TaskItem({required this.task, required this.onToggleCheck});

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
                onToggleCheck(task); // 탭하면 체크
              },
              child: Icon( // 탭하면 체크 표시되도록 함
                task.isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
                color: task.isChecked ? Colors.green : Colors.grey,
              ),
            ),
          ),
          title: Text(task.title + " " + task.emoji),
        ),
      ),
    );
  }
}
