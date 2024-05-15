import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xffFBFBFB),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 2,
          offset: Offset(0, 1),
        )],
        border: Border.all(
          color: Color(0xFF9A9A9A),
          width: 0.7, // 테두리의 두께
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF9A9A9A)),
          border: InputBorder.none, // 내부 테두리 제거
        ),
      ),
    );
  }
}
