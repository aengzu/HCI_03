import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hci_03/constants/theme.dart';

class PromiseWidget extends StatelessWidget {
  const PromiseWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffffe7f1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffbcb7b7).withOpacity(0.25),
              offset: const Offset(0, 1),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '🔥 이번달 공약 🔥',
              style: textTheme().titleMedium?.copyWith(fontSize: 19.0),
            ),
            Text('진 사람이 xxx하기',
                style: textTheme().bodyMedium),
            SizedBox(height: 3.0),
            GestureDetector(
              onTap: () {
                // 대결 진행상황 페이지로 라우팅
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 9.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: const Color(0xff4C4C4C),
                ),
                child: Text('대결 진행상황 보러가기',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
