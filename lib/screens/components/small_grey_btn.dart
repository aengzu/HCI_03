import 'package:flutter/material.dart';

import '../../constants/theme.dart';

class SmallGreyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SmallGreyButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0, // 버튼의 높이 설정// 화면 가로 크기의 80%에 해당하는 너비 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffC5C9C6), // 버튼의 배경색
          elevation: 2, // 그림자 높이 설정
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0), // 버튼 모양을 둥글게 설정
          ),
        ),
        onPressed: onPressed, // 버튼 클릭 이벤트 연결
        child: Text(
          label,
          style: textTheme().displaySmall,
        ),
      ),
    );
  }
}
