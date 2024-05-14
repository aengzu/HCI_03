import 'package:flutter/material.dart';
import 'package:hci_03/constants/image_assets.dart';
import 'package:hci_03/models/task.dart';

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
        height: 62.0,  // Fixed height
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
          leading: ImageIcon(
            AssetImage(task.isChecked ? ImageAssets.uncheckedOwn : ImageAssets.uncheckedOwn),
          ),
          title: Text(task.title + "  " + task.emoji),
        ),
      ),
    );
  }
}
