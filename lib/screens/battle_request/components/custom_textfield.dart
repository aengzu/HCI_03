import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';

import '../../../models/friend.dart';

class CustomTextField extends StatelessWidget {
  final Friend friend;
  const CustomTextField({super.key, required this.friend});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.75,
      height: 55.0,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        enabled: false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: friend.memberId,
          hintStyle: textTheme().bodyLarge,
        ),
      ),
    );
  }
}
