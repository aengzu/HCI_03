import 'package:flutter/material.dart';
import 'package:hci_03/constants/theme.dart';

class InputSpurCommentWidget extends StatelessWidget {
  const InputSpurCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.center,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffe6ffea),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffbcb7b7).withOpacity(0.25),
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 1),
            )
          ]),
      child: Text(
        '직접 입력하기 ✏️',
        style: textTheme().titleSmall),
    );
  }
}
