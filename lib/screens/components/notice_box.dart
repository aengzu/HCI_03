import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';
import 'package:hci_03/models/request_title.dart';

class NoticeBox extends StatelessWidget {
  final Notice notice;

  NoticeBox({required this.notice});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth*0.9,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFFFE7F1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notice.title,
              style: textTheme().titleSmall,
            ),
            Text(
              notice.description,
              style: textTheme().bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}