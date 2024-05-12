import 'package:flutter/material.dart';

class SpurOnTopBarWidget extends StatelessWidget {
  const SpurOnTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffffe7f1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffbcb7b7).withOpacity(0.25),
              offset: const Offset(0, 1),
            )
          ]),
      child: Text(
        '친구에게 격려의 문자를 보내주세요! 💌',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
