import 'package:flutter/material.dart';
import 'package:hci_03/models/task.dart';
import 'package:hci_03/screens/battle_request/components/task_addbtn.dart';
import 'package:hci_03/screens/battle_request/components/task_item.dart';

class TaskContainer extends StatefulWidget {
  @override
  _TaskContainerState createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  List<Task> tasks = List.from(dummyTasks); // Initialize with dummyTasks

  void addTask(String title, String emoji) {
    setState(() {
      tasks.add(Task(title: title, emoji: emoji, isChecked: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth * 0.80,
      child: ListView.builder(
        itemCount: tasks.length + 1, // Increase the item count by 1
        itemBuilder: (context, index) {
          if (index == tasks.length) {
            // Return TaskButton for the last item
            return TaskAddButton(addTask: addTask);
          } else {
            // Return TaskItem for other items
            return TaskItem(task: tasks[index]);
          }
        },
      ),
    );
  }
}
