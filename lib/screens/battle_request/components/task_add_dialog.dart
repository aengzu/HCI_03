import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/components/small_btn.dart';
import 'package:hci_03/screens/components/small_grey_btn.dart';

class NewTaskDialog extends StatelessWidget {
  final Function(String, String) addTask;

  NewTaskDialog({required this.addTask});

  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _emojiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 35.0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        '새로운 Task 추가하기',
        style: textTheme().titleMedium,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              hintText: 'Task 입력',
              hintStyle: textTheme().bodyMedium,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          TextField(
            controller: _emojiController,
            decoration: InputDecoration(
              hintText: 'Emoji 입력',
              hintStyle: textTheme().bodyMedium,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallGreyButton(label: '취소', onPressed: () {
              Navigator.of(context).pop();
            }),
            SizedBox(width: 10),
            SmallButton(label: '추가', onPressed: () {
              addTask(_taskController.text, _emojiController.text);
              Navigator.of(context).pop();
            }),
          ],
        ),
      ],
    );
  }
}