import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/screens/components/custom_light_btn.dart';
import 'package:hci_03/screens/components/grey_btn.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String hintText;
  final ValueChanged<String> onConfirm;
  final TextEditingController textController = TextEditingController();

  CustomDialog({
    required this.title,
    required this.hintText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 35.0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      title: Text(
        title,
        style: textTheme().titleLarge,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textController,
            cursorColor: Colors.green,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textTheme().bodySmall,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
      actions: [
        CustomButtonLight(
          label: "추가",
          onPressed: () {
            String friendId = textController.text.trim();
            Navigator.of(context).pop();
            onConfirm(friendId);
          },
        ),
        SizedBox(height: 15),
        GreyButton(
          label: "취소",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
