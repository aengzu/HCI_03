import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PromiseWidget extends StatelessWidget {
  const PromiseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffffe7f1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffbcb7b7).withOpacity(0.25),
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '🔥 이번달 공약 🔥',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text('진 사람이 xxx하기',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
          GestureDetector(
            onTap: () {
              // 대결 진행상황 페이지로 라우팅
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
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
    );
  }
}
