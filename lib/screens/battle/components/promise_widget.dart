import 'package:flutter/material.dart';

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
    );
  }
}
