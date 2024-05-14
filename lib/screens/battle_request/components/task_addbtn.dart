import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/battle_request/components/task_add_dialog.dart';

class TaskAddButton extends StatelessWidget {
  final Function(String, String) addTask;

  TaskAddButton({required this.addTask});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          // Show the dialog when the button is pressed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewTaskDialog(addTask: addTask);
            },
          );
        },
        child: Container(
          width: screenWidth * 0.80,
          height: 60.0,  // Set height to match TaskItem
          decoration: BoxDecoration(
            color: Color(0xffE6FFEA),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "직접 입력하기 ✏️",
              style: textTheme().bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
